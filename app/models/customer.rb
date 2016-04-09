class Customer
  attr_reader :name, :address
  attr_accessor :id, :orders

  def initialize(attributes={})
    @name = attributes[:name]
    @address = attributes[:address]
    @id = attributes[:id]
    @orders = []
  end

  def remove_order(order)
    @orders.delete(order)
  end
end
