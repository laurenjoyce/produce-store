class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :vegetable

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
