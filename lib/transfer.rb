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
    if @sender.balance < @amount
      @status = "Transaction rejected. Please check your account balance."
    elsif @sender.close_account == true || @receiver.close_account == true
      @status = "rejected"
    else 
      @status = "complete"
    end
  end
  
end
