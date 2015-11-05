class AddIngredientsToRecipe < ActiveRecord::Migration
  def change
      change_table :recipes do |t|
      t.text :ingredients
    end
  end
end
