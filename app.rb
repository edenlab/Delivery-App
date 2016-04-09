# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#    $ ruby app.rb
#
require_relative 'app/models/customer'
require_relative 'app/models/employee'
require_relative 'app/models/order'

require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/repositories/order_repository'

require_relative 'app/controllers/employees_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/orders_controller'
require_relative 'router'

customer_repository = CustomerRepository.new('data/customers.csv')
employee_repository = EmployeeRepository.new('data/employees.csv')
order_repository = OrderRepository.new('data/orders.csv', customer_repository, employee_repository)

router = Router.new(customer_repository, employee_repository, order_repository)

router.run


# eden = Customer.new(name: "Eden", address: "Tweede Jacob Van Campenstraat, Amsterdam")

# p customer_repository.add_customer(eden)
# bobby = employee_repository.find(1)



#pasta = Orders.new(meal: "pasta")

# pasta.assign_to_employee(booby)
# pasta.assign_to_customer(eden)




#p orders.add_orders(order)


# p customers.load_csv('data/customers.csv')
# p customers.find(1)
# order_repository.add_orders(pasta)
# p orders.load_csv('data/orders.csv')

