class Sold_Product < ActiveRecord::Base
  has_many :products
  belongs_to :purchases

  def self.most_popular
    items_sold = Sold_Product.select(:name).distinct
    quantities = []
    item_names = []
    items_sold.each do |item_name|
      total_quantity = 0
      Sold_Product.all.each do |item_object|
        if item_object.name == item_name['name']
          total_quantity += item_object.quantity
        end
      end
      item_names << item_name['name'].to_sym
      quantities << total_quantity
    end
    awesomeness = Hash[item_names.zip quantities]
    awesomeness.values.sort.reverse!
  end
end
