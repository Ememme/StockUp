class AddUserToStorage < ActiveRecord::Migration[5.1]
  def change
    add_reference :storages, :user, foreign_key: true
  end
end
