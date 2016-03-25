class CartedProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :product, class_name: :Vegetable
  belongs_to :order
end
