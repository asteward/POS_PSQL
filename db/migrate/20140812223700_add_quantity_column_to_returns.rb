class AddQuantityColumnToReturns < ActiveRecord::Migration
  def change
    add_column :returns, :quantity, :integer
  end
end
