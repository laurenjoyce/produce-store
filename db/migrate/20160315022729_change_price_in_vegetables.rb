class ChangePriceInVegetables < ActiveRecord::Migration
  def change
    change_column :vegetables, :price, :decimal, precision: 5, scale: 2
    change_column :vegetables, :description, :text
  end
end
