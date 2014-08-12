module Super
    def self.most_popular
    items_sold = self.select(:name).distinct
    quantities = []
    item_names = []
    items_sold.each do |item_name|
      total_quantity = 0
      self.all.each do |item_object|
        if item_object.name == item_name['name']
          total_quantity += item_object.quantity
        end
      end
      item_names << item_name['name'].to_sym
      quantities << total_quantity
    end
    awesomeness = Hash[item_names.zip quantities]
    awesomeness.values.sort.reverse!
    awesomeness
  end
end
