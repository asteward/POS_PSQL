require 'active_record'
require './lib/cashier'
require './lib/customer'
require './lib/product'
require './lib/purchase'

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
    puts "Select E to exit the POS"
    print "\n>"
    user_input = gets.chomp
    case user_input
      when 'C' then create_customer
      when 'L' then create_cashier
      when 'A' then create_product
      when 'R'
      when 'T'
      when 'E'
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
  product_price = gets.chomp
  product = Product.create({name: product_name, price: product_price})
  puts "#(product.name} with a price of #{product.price} has been added."
end

welcome
