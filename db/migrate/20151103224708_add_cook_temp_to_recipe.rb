class AddCookTempToRecipe < ActiveRecord::Migration
  def change
    change_table :recipes do |t|
      t.string :cook_temp
    end
  end
end
