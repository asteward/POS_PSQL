class RemoveColumnsFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :quantity
    remove_column :products, :purchase_id
  end
end
