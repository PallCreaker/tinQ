class PostProductsController < ApplicationController
  before_action :set_post_product #, only: [:show, :edit, :update, :destroy]


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_product
      @post_product = PostProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_product_params
      params[:post_product]
      params.require(:post_product).permit(:post_id, :product_id)
    end
end
