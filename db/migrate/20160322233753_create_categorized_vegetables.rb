class CreateCategorizedVegetables < ActiveRecord::Migration
  def change
    create_table :categorized_vegetables do |t|
      t.integer :category_id
      t.integer :vegetable_id

      t.timestamps null: false
    end
  end
end
