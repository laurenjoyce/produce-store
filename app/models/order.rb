class Order < ActiveRecord::Base
  belongs_to :user
  has_many :carted_products
  has_many :vegetables, through: :carted_products

  def subtotal
    vegetable.price * quantity
  end
    
  def tax
    subtotal * 0.09 
  end

  def total_cost
    subtotal + tax
  end
end
