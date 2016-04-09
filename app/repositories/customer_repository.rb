require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []

    load_csv
  end

  def add_customer(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer

    write_csv
  end

  def delete_customer(customer)
    @customers.delete(customer)
    write_csv
  end

  def all
    return @customers
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  private

  def load_csv
    @next_id = 0
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      customer = Customer.new(
        id: row[:id].to_i,
        name: row[:name],
        address: row[:address],
        )
        @next_id = customer.id
        @customers << customer
     end
     @next_id += 1
  end

  def write_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

    CSV.open(@csv_file, 'w', csv_options) do |csv|
      csv << ['id', 'name', 'address']

      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
