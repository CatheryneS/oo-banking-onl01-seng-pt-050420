class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    @sender.valid? == true && @receiver.valid? == true
  end
  
  def execute_transaction
    if valid? && self.status == "pending" && @sender.balance > @amount
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @amount = 0.0 && self.status = "complete"
    else
      "Transaction rejected. Please check your account balance."
    end
  end
  
  
    
end
