class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :price, :float
      t.column :quantity, :integer
      t.belongs_to :purchase
    end
  end
end
