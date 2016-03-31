class CartedProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @carted_products = current_user.carted_products.where(status: 'In Cart')
    if @carted_products.length == 0
      flash[:warning] = "You don't have any items in your cart!"
      redirect_to "/"
    else
      render "index.html.erb"
    end
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

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "Removed")
    flash[:sucess] = "Product successfully removed!"
    redirect_to "/carted_products"
  end
end



