class AddStorageToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :storage, foreign_key: true
  end
end
