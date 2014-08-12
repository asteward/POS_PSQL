class CreateReturns < ActiveRecord::Migration
  def change
    create_table :returns do |t|
      t.string :name
      t.float :cost
    end
  end
end
