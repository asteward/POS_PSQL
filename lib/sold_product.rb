class Sold_Product < ActiveRecord::Base
  has_many :products
  belongs_to :purchases
end
