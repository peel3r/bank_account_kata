class Transaction

  attr_reader :date, :amount, :balance

  def initialize amount, date,  balance
    @date = date
    @amount = amount
    @balance = balance
  end

end