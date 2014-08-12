class CreateCashierAndPurchases < ActiveRecord::Migration
  def change
    create_table :cashiers do |t|
      t.string :name
    end

    create_table :purchases do |t|
      t.float :total
    end

    create_table :cashiers_purchases do |t|
      t.belongs_to :cashier
      t.belongs_to :customer
      t.belongs_to :purchase
    end
  end
end
