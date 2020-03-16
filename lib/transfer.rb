class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid? 
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
     
    if(@status == "pending")
      sender.balance -= amount
      if(valid?)
        receiver.balance += amount
        @status = "complete"
        @status.freeze
      else
        @status = "rejected"
        @status.freeze 
        "Transaction rejected. Please check your account balance."
      end
    end
  end
  
  def reverse_transfer
    if(status == "complete")
      sender.balance += amount 
      receiver.balance -= amount
      @status = "reversed" 
      @status.freeze
    end
  end
end
