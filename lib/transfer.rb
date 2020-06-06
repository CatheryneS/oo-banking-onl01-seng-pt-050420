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
    if @sender.valid? && @sender.balance > @amount && @status == 'pending'
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    elsif @sender.balance < @amount && @status == 'pending'
      @status = "Transaction rejected. Please check your account balance."
    end
  end
  
end
