class CreateSoldProducts < ActiveRecord::Migration
  def change
    create_table :sold_products do |t|
      t.column :name, :string
      t.column :price, :float
      t.column :quantity, :integer
      t.belongs_to :purchase
    end
  end
end
