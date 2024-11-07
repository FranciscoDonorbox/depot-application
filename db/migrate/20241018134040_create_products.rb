class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end

    add_index :products, :title, unique: true
  end
end
