class CreateProductServices < ActiveRecord::Migration[6.0]
  def change
    create_table :product_services do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.string :category
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
