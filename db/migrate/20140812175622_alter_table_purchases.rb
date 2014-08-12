class AlterTablePurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :cashier_id, :integer
    add_column :purchases, :customer_id, :integer
  end
end
