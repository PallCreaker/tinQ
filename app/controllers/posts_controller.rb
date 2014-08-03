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
    #@post_product = PostProduct.new

    3.times {
      #関連オブジェクトをbuild
      @post.products.build
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
    # todo: トランザクション
    @post = Post.new(content: params[:post][:content], user_id: current_user.id)
    #@post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        #PostProduct.create(post_id: @post.id, product_id: params[:post_product][:id])
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
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
      params.require(:post).permit(:content, :user_id, :image)
    end

    def create_post_product(post_id, product_name)
      product = Product.where("goods_name = ?, #{product_name}").limit(1)
      @post_product = PostProduct.new(post_id: post_id, product_id: product.id)
      @post_product.save
    end
end
