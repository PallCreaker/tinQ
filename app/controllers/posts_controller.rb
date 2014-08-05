class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :fetch_product_data, only: [:create, :new, :edit, :update]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    3.times {
      #関連オブジェクトをbuild
      @post.post_products.build
    }
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @post_product = PostProduct.where(post_id: params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    #Post.transaction do
      @post = Post.new(content: params[:post][:content], user_id: current_user.id, image: params[:post][:image])
      if @post.save
        params[:post][:post_products_attributes].each do |i|
          @post_product = PostProduct.new(post_id: @post.id, product_id: i[:id])
          @post_product.save
        end
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    #end
  #rescue
    #redirect_to new_post_path, alert:'Postの作成に失敗しました。'
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def fetch_product_data
      @products = Product.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :user_id, :image, products_attributes:[:id, :product_id, :_destroy])
    end

    def create_post_product(post_id, product_name)
      product = Product.where("goods_name = ?, #{product_name}").limit(1)
      @post_product = PostProduct.new(post_id: post_id, product_id: product.id)
      @post_product.save
    end
end
