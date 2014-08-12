require 'active_record'
require './lib/cashier'
require './lib/customer'
require './lib/product'
require './lib/purchase'
require './lib/sold_product'
require 'Date'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "\nWelcome to the Point of Sale (POS) system!"
  menu
end

def menu
  choice = nil
    puts "\nSelect C to create a new customer"
    puts "Select L to create logins for new cashiers"
    puts "Select A add a new product"
    puts "Select R to initiate a return"
    puts "Select T to begin a new transaction"
    puts "Select P to find our most popular products"
    puts "Select E to exit the POS"
    print "\n>"
    user_input = gets.chomp
    case user_input
      when 'C' then create_customer
      when 'L' then create_cashier
      when 'A' then create_product
      when 'R' then return_product
      when 'T' then transaction
      when 'P' then popular_products
      when 'E' then exit
    end
  menu
end

def create_customer
  puts "Enter customer name:"
  print ">"
  customer_name = gets.chomp
  customer = Customer.create({name: customer_name})
  puts "#{customer.name} has been added."
end

def create_cashier
  puts "Enter cashier name:"
  print ">"
  cashier_name = gets.chomp
  cashier = Cashier.create({name: cashier_name})
  puts "#{cashier.name} has been added."
end

def create_product
  puts "Enter product name:"
  print ">"
  product_name = gets.chomp
  puts "Enter product price:"
  print ">$"
  product_price = gets.chomp.to_f
  product = Product.create({name: product_name, price: product_price})
  puts "#{product.name} with a price of #{product.price} has been added."
end

def return_product
  puts "Enter name of product to return:"
  print ">"
  product_name = gets.chomp
  puts "Enter purchase price of product:"
  print ">$"
  product_price = gets.chomp.to_f
  return_item = Return.create({:name => product_name, :cost => product_price})
  puts "#{product_name} has been successfully returned."
  puts "You have been credited $#{product_price}."
end

def transaction
  puts "Select cashier name:"
  Cashier.all.each { |cashier| puts cashier.name }
  print ">"
  cashier_name = gets.chomp
  cashier = Cashier.find_or_create_by(:name => cashier_name)
  puts "Select customer name:"
  Customer.all.each { |customer| puts customer.name }
  print ">"
  time = Date.today
  customer_name = gets.chomp
  customer = Customer.find_or_create_by(:name => customer_name)
  purchase = Purchase.create({:total => 0.00, :customer_id => customer['id'], :cashier_id => cashier['id'], :date => time})
  total = 0.00
  choice = 'x'
  until choice == 'n'
    puts "Select a product you would like to purchase: "
    Product.all.each { |product| puts "#{product.id}. #{product.name} at $#{product.price} each" }
    print ">"
    product_id = gets.chomp
    product = Product.find(product_id)
    puts "Enter quantity:"
    print ">"
    quantity = gets.chomp.to_i
    sold_product = Sold_Product.create({:name => product['name'], :price => product['price'], :quantity => quantity, :purchase_id => purchase['id']})
    total += (product['price'].to_f * quantity)
    puts "Add another product? (y/n)"
    choice = gets.chomp
  end
  purchase.update({:total => total})
  puts "Total: $#{total}"
  puts "\nTransaction complete! Press ENTER to continue..."
  gets
end

def popular_products
  Sold_Product.most_popular
  puts "Most popular products in descending order of popularity\n"
  awesomeness.each { |key, value| puts "#{key}, quantity #{value}" }
  puts "Press ENTER to continue..."
  gets
end

welcome
