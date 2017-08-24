class CreateProductTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :product_types do |t|
      t.string :product_type
      t.string :unit
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
