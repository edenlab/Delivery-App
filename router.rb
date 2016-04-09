# TODO: implement the router of your app
require_relative 'app/controllers/employees_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/orders_controller'

class Router
  def initialize(customer_repository, employee_repository, order_repository)
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @running = true
  end

  def run
    @customers_controller    = CustomersController.new(@customer_repository)
    @employees_controller = EmployeesController.new(@employee_repository)
    @orders_controller = OrdersController.new(@customer_repository, @employee_repository, @order_repository)

    puts 'Welcome to Le Restaurant'

    # signin_employee

    while @running
      display_actions

      puts 'What do you want to do?'
      action = gets.chomp.to_i

      dispatch_action(action)
    end
  end

  private

  # def signin_employee
  #   session = SessionController.new
  #   session.signin
  # end

  def display_actions
    puts '---'
    puts '1. List Employees'
    puts '2. List Customers'
    puts '3. List Orders'
    puts '4. Add Customer'
    puts '5. Add Order'
    puts '6. Mark order as delivered'
    puts '7. Delete Customer'
    puts '8. Delete Order'
    puts '9. Exit'
  end

  def dispatch_action(action)
    case action
    when 1 # list employees (works!)
      @employees_controller.index
    when 2 # list customers (works!)
      @customers_controller.index
    when 3 # list orders (works!)
      @orders_controller.index
    when 4 # add customer (works!)
      @customers_controller.add
    when 5 # add order (works!)
      @orders_controller.add
    when 6 # mark order as delivered (works!)
      @orders_controller.delivered
    when 7 # delete customer (works!)
      @customers_controller.delete
    when 8 # delete order (works!)
      @orders_controller.delete
    when 9 # Exit (works!)
      @running = false
    end
  end
end
