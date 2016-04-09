require_relative '../views/employees_view'
require_relative '../repositories/employee_repository'
require_relative '../models/employee'

class EmployeesController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = EmployeesView.new
  end

  def index
    employees = @employee_repository.all
    @view.display_employees(employees)
  end
end
