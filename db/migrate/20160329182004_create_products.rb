class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :category
      t.string :type
      t.string :brand
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image1
      t.string :image2

      t.timestamps null: false
    end
  end
end
