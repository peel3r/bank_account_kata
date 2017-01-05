class Account

  attr_reader :balance

  def initialize
    @balance = 0.00
    @statement = Statement.new

  end

  def deposit amount, date = Time.now
    @balance += amount
    @statement.add(Transaction.new(amount, date, balance))

  end

  def withdraw amount, date = Time.now
    @balance -= amount
    @statement.add(Transaction.new(-amount, date, balance))

  end

  def statement
     @statement.print
  end

end