class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  
  def initialize(name)
    @name = name
    @balance = 1000.00
    @status = "open"
  end
  
  def deposit
    
  end
end
