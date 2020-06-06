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
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    @receiver.balance = @receiver.balance - @amount
    @sender.balance = @sender.balance + @amount
  end
end
