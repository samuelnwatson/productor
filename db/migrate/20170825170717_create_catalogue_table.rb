class CreateCatalogueTable < ActiveRecord::Migration[5.1]
  def change
    create_table :catalogues do |t|
      t.belongs_to :product, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
