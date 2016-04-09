class OrdersView
  def display_orders(orders)
    orders.each do |order|
      if order.delivered?
        puts "#{order.id}. [x] #{order.meal} to #{order.customer.name} by #{order.employee.name}"
      else
        puts "#{order.id}. [ ] #{order.meal} to #{order.customer.name} by #{order.employee.name}"
      end
    end
  end

  def display_customers(customers)
    customers.each do |customer|
      puts "[#{customer.id}], #{customer.name}, #{customer.address}"
    end
  end

  def display_employees(employees)
    employees.each do |employee|
      puts "[#{employee.id}], #{employee.name}"
    end
  end

  def add_order
    puts "What is your order?"
    print "> "
    gets.chomp
  end

  def assign_customer
    puts "Select the customer who made the order"
    print "> "
    gets.chomp.to_i
  end

  def assign_employee
    puts "Select the employee who made the order"
    print "> "
    gets.chomp.to_i
  end

  def delivered
    puts "Please type the number of the order which has been delivered"
    print "> "
    gets.chomp.to_i
  end

  def delete
    puts "Which order do you want to delete"
    print "> "
    gets.chomp.to_i
  end
end
