class AddSupplierIdToVegetable < ActiveRecord::Migration
  def change
    add_column :vegetables, :supplier_id, :integer
  end
end
