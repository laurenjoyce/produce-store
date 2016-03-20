class ChangeProductIdToVegetableId < ActiveRecord::Migration
  def change
    rename_column :orders, :product_id, :vegetable_id
  end
end
