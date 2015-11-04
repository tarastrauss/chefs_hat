class AddNameToRecipes < ActiveRecord::Migration
  def change
    change_table :recipes do |t|
      t.string :name
    end
  end
end
