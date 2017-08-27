class AddUserToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :user, :string, null: false
  end
end
