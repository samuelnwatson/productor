class AddCategoriesToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :categories, index: true, foreign_key: true, null: false, default: 'none'
  end
end
