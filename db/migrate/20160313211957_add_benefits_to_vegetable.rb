class AddBenefitsToVegetable < ActiveRecord::Migration
  def change
    add_column :vegetables, :health_benefits, :string
  end
end
