class AddProductsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :products, index: true, foreign_key: true, null: false, default: 'none'
  end
end
