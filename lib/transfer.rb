require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    while @counter<1
    if @sender.valid? && @receiver.valid?
      @receiver.balance += @amount
      @receiver.balance
      @sender.balance -=@amount
      @sender.balance
      if @sender.balance <= 0
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      else
        @status = "complete"
      end
      @counter+=1
    else
      @status = "rejected"
      @counter+=1
      return "Transaction rejected. Please check your account balance."
    end
    #@counter+=1
  end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end