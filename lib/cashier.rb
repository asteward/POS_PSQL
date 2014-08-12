class Cashier < ActiveRecord::Base
  has_many :customers
  has_many :purchases
  has_many :products, :through => :purchases
end


