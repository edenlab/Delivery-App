require_relative '../models/employee'

class EmployeeRepository

  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []

    load_csv
  end

  def all
    return @employees
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

def load_csv
    @next_id = 0
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      employee = Employee.new(
        id: row[:id].to_i,
        name: row[:name],
        manager: row[:manager] == "true",
        user_name: row[:user_name],
        password: row[:password]
        )
        @next_id = employee.id
        @employees << employee
     end
     @next_id += 1
  end
end


