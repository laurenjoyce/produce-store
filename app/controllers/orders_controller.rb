class OrdersController < ApplicationController
  def create
    subtotal = Vegetable.find_by(id: params[:vegetable_id]).price.to_i * params[:quantity].to_i
    tax = subtotal * 0.09
    total = subtotal + tax
    
    Order.create(
      vegetable_id: params[:vegetable_id], 
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    @order = Order.last
    render 'show.html.erb'
  end
end