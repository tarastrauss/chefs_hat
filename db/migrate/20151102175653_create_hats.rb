class CreateHats < ActiveRecord::Migration
  def change
    create_table :hats do |t|
      t.string :name
      t.string :image_uri
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
