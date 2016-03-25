class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.all
    if current_user
      @carted_products = current_user.carted_products
    end
    render "index.html.erb"
  end
  
  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:vegetable_id], 
      quantity: params[:quantity],
      status: params[:status]
    )
    redirect_to "/vegetables/#{params[:vegetable_id]}"
    flash[:success] = "You've successfully carted your products!"
  end
end

