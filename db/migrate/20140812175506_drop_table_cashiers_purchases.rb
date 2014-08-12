class DropTableCashiersPurchases < ActiveRecord::Migration
  def change
    drop_table :cashiers_purchases
  end
end
