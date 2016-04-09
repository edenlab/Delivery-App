require_relative '../views/customers_view'
require_relative '../repositories/customer_repository'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def index
    customers = @customer_repository.all
    @view.display_customers(customers)
  end

  def add
    name = @view.customer_name
    address = @view.customer_address
    new_customer = Customer.new(name: name, address: address)
    @customer_repository.add_customer(new_customer)
  end

  def delete
    # Ask user which order he wants to delete
    puts index
    id = @view.delete
    # Find order in order_repositary
    customer_to_delete = @customer_repository.find(id)
    # Delete
    @customer_repository.delete_customer(customer_to_delete)
  end

end
