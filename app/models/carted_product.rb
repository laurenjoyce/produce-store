class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :product, class_name: :Vegetable
  belongs_to :order

  validates :status, inclusion: { 
    in: ["In Cart", "Purchased", "Removed"]}
end
