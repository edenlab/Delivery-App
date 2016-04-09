require_relative '../views/orders_view'
require_relative '../repositories/order_repository'
require_relative '../models/order'

class OrdersController
  def initialize(customer_repository, employee_repository, order_repository)
    @order_repository = order_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @view = OrdersView.new
  end

  def index
    orders = @order_repository.all
    @view.display_orders(orders)
  end

  def add
    # Ask user for order
    order = @view.add_order
    # Ask user for customer
    customers = @customer_repository.all
    @view.display_customers(customers)
    id = @view.assign_customer
    customer = @customer_repository.find(id)
    # Ask user for employee
    employees = @employee_repository.all
    @view.display_employees(employees)
    id = @view.assign_employee
    employee = @employee_repository.find(id)
    # Create the order
    new_order = Orders.new(meal: order, employee: employee, customer: customer)
    # Assign customer and employee
    new_order.assign_to_customer(customer)
    new_order.assign_to_employee(employee)
    @order_repository.add_orders(new_order)
  end

  def delivered
    # Ask user which order he wants to select
    puts index
    id = @view.delivered
    # Find order in order_repository
    order = @order_repository.find(id)
    # Mark as delivered
    order.delivered
  end

  def delete
    # Ask user which order he wants to delete
    puts index
    id = @view.delete
    # Find order in order_repositary
    order_to_delete = @order_repository.find(id)
    # Delete
    @order_repository.delete_order(order_to_delete)
  end
end
