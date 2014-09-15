class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :comment]
  before_action :set_product, only: [:new, :edit]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
    # product作成フォーム用に3回だけproductと、それに関連するpost_productをbuildする
    3.times {
      @post.products.build
    }
  end

  def edit
  end

  def create
    Post.transaction do
      @post = Post.new(content: params[:post][:content], image: params[:post][:image], user_id: current_user.id)
      params[:post][:products_attributes].each do |pp|
        # productを作るのに必要な情報が揃っている場合のみproductをbuildする(同時にpost_productもbuildされる)
        if pp[:goods_name].present? && pp[:brand_id] && pp[:child_category_id]
          @post.products.build(goods_name: pp[:goods_name], brand_id: pp[:brand_id], child_category_id: pp[:child_category_id], image: pp[:image])
        end
      end
      @post.save!
      redirect_to @post, notice: 'Posted.'
    end
  rescue
    redirect_to new_post_path, alert:'Post was failed.'
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was updated.'
    else
      redirect_to edit_post_path, alert: 'Editing Post was failed.'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was destroyed.'
  end

  def comment
    # binding.pry
    @post.comments.create(content: params[:comment][:content], user_id: current_user.id)
    redirect_to post_url(id: @post.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_product
      @brands = Brand.all
      @child_categories = ChildCategory.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :user_id, :image, products_attributes:[:goods_name, :brand_id, :child_category_id, :image])
    end

    def create_post_product(post_id, product_name)
      product = Product.where("goods_name = ?, #{product_name}").limit(1)
      @post_product = PostProduct.new(post_id: post_id, product_id: product.id)
      @post_product.save
    end
end
