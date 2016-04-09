require 'csv'

require_relative '../models/order'

class OrderRepository
  def initialize(csv_file, customer_repository, employee_repository)
    @csv_file = csv_file
    @orders = []
    @customer_repository = customer_repository
    @employee_repository = employee_repository

    load_csv
  end

  def add_orders(order)
    order.id = @next_id
    @next_id += 1
    @orders << order

    write_csv
  end

  def delete_order(order)
    # Remove order
    @orders.delete(order)
    write_csv
  end

  def all
    return @orders
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end


  def load_csv
    @next_id    = 0
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      order = Orders.new(
        id:      row[:id].to_i,
        meal:    row[:meal]
      )
      customer = @customer_repository.find(row[:customer_id].to_i)
      order.assign_to_customer(customer)

      employee = @employee_repository.find(row[:employee_id].to_i)
      order.assign_to_employee(employee)

      @next_id = order.id
      @orders << order
    end
    @next_id += 1
  end

  def write_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

    CSV.open(@csv_file, 'w', csv_options) do |csv|
      csv << ['id', 'meal', 'customer_id', 'employee_id']

      @orders.each do |order|
        csv << [order.id, order.meal, order.customer.id, order.employee.id]


      end
    end
  end
end

