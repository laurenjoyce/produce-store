class OrdersController < ApplicationController
  def create
    Order.create({
      user_id: current_user.id, 
      vegetable_id: params[:vegetable_id], 
      quantity: params[:quantity]})
    @order = Order.last
    render 'show.html.erb'
  end
end