class Sold_Product < ActiveRecord::Base
  extend Super
  has_many :products
  belongs_to :purchases
end
