class EmployeesView
  def display_employees(employees)
    employees.each do |employee|
      puts "[#{employee.id}], #{employee.name}"
    end
  end
end
