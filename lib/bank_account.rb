class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize(name)
    @name = name
    @balance = 1000.00
    @status = "open"
  end
  
  def deposit(amount)
    @balance = @balance + amount
  end
  
  def display_balance
    "Your balance is $#{self.balance}."
  end
  
  def valid?
    self.status == open 
  end
end
