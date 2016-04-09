class Employee

attr_reader :name, :manager, :user_name, :password
attr_accessor :orders, :id

  def initialize(attributes={})
    @name = attributes[:name]
    @manager = attributes[:manager] || false
    @user_name = attributes[:user_name]
    @password = attributes[:password]
    @id = attributes[:id]
    @orders = []
  end

  def manager?
    @manager = true
  end
end
