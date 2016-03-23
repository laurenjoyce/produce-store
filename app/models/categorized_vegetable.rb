class CategorizedVegetable < ActiveRecord::Base
  belongs_to :category
  belongs_to :vegetable
end
