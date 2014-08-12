require 'active_record'
require './lib/cashier'
require './lib/customer'
require './lib/product'
require './lib/purchase'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to the Point of Sale (POS) system!"
  menu
end

def menu
  choice = nil
    puts "Select C to create a new customer"
    puts "Select L to create logins for new cashiers"
    puts "Select A add a new product"
    puts "Select R to initiate a return"
    puts "Select T to begin a new transaction"
    puts "Select E to exit the POS"
    user_input = gets.chomp
    case user_input
      when 'C' then create_customer
      when 'L'
      when 'A'
      when 'R'
      when 'T'
      when 'E'
    end
  menu
end

def create_customer

end


welcome
