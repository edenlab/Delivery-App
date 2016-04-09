
require_relative '../repositories/customer_repository'

class CustomersView

  def display_customers(customers)
    customers.each do |customer|
      puts "[#{customer.id}], #{customer.name}, #{customer.address}"
    end
  end

  def customer_name
    puts "what's the customer's name?"
    print "> "
    name = gets.chomp
  end

  def customer_address
    puts "what's the customer's address?"
    print "> "
    address = gets.chomp
  end

def delete
    puts "Which customer do you want to delete"
    print "> "
    gets.chomp.to_i
  end

end
