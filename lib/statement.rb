class Statement
attr_reader :transactions
  def initialize transactions = []
    @transactions = transactions
  end

  def add transaction
    @transactions << transaction
  end

  def print
    output = "date || credit || debit || balance ||\n"
    @transactions.reverse.each { |t| output += format_line(t) }
    output
  end

def format_line(t)
  line = t.date.strftime("%d/%m/%Y") + " || " +
      "#{ format("%.2f", t.amount) + " " if t.amount >= 0 }|| " +
      "#{ format("%.2f", -t.amount) + " " if t.amount < 0 }|| " +
      format("%.2f", t.balance) + " ||\n"
end

end