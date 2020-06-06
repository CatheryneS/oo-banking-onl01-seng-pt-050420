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
    @sender.balance = @sender.balance - @amount
    @receiver.balance = @receiver.balance + @amount
    @amount = 0
    if @sender.valid? == false || @receiver.valid? == false 
      @status = "Transaction rejected. Please check your account balance."
    elsif @sender.
    else 
      @status = "complete"
    end
  end
  
end
