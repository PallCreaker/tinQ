class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  #before_action :fetch_brand_data, only: [:create, :new, :edit, :update]

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
    @brands = Brand.all
    @child_categories = ChildCategory.all
    3.times {
      #関連オブジェクトをbuild
      @post.products.build
    }
  end

  # GET /posts/1/edit
  def edit
    # @post = Post.find(params[:id])
    @post_product = PostProduct.where(post_id: params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
        @brands = Brand.all
        @child_categories = ChildCategory.all
    #Post.transaction do
      @post = Post.new(content: params[:post][:content], image: params[:post][:image], user_id: current_user.id)

      # 配列の個数分をループでbuildする
      product_params = params[:post][:products_attributes]
      logger.debug(product_params)
      product_params.each do |pp|
        logger.debug(pp)
        @post.products.build(pp)
      end

=begin
      @product1 = Product.new(params[:post][products_attributes][0])
      @product2 = Product.new(params[:post][products_attributes][1])
      @product3 = Product.new(params[:post][products_attributes][2])
      @products = [@product1, @product2, @product3]
      @products.each do |product|
        logger.debug(product)
        if product.present?
          #@product = Product.new(product)
          product.save
        end
      end
=end
      #@post.product = products_attributes:[:name, :brand_id, :child_category_id, :_destroy])
      if @post.save
        #@post.save
        #if params[:post][:post_products_attributes][0].present?
          #@post_product = PostProduct.new(post_id: @post.id, product_id: params[:post][:post_products_attributes][0][:id])
          #@post_product.save
        #end
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

    def fetch_brand_data
      @brands = Brand.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :user_id, :image, products_attributes: [])
    end

    def create_post_product(post_id, product_name)
      product = Product.where("goods_name = ?, #{product_name}").limit(1)
      @post_product = PostProduct.new(post_id: post_id, product_id: product.id)
      @post_product.save
    end
end
