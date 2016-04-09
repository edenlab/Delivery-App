class Orders

attr_reader :customer, :employee, :meal
attr_accessor :id

  def initialize(attributes={})
    @meal = attributes[:meal]
    @delivered = attributes[:delivered] || false
    @id = attributes[:id]

    @customer = nil
    @employee = nil
  end

  def assign_to_customer(customer)
    @customer = customer
    customer.orders << self
  end

  def assign_to_employee(employee)
    @employee = employee
    employee.orders << self
  end

  def delivered
    @delivered = true
  end

  def delivered?
    @delivered
  end
end




