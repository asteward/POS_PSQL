class Purchase < ActiveRecord::Base
  has_many :products
  belongs_to :customer
  belongs_to :cashier
end
