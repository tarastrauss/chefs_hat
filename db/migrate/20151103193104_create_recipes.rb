class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :instructions
      t.string :cook_method
      t.string :cook_time
      t.string :image_uri
      t.references :user, index: true, foreign_key: true
      t.references :hat, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
