class Category < ActiveRecord::Base
  has_many :categorized_vegetables
  has_many :vegetables, through: :categorized_vegetables
end

