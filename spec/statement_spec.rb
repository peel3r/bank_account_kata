require 'spec_helper'
require_relative  '../lib/statement'

describe Statement do
  subject(:statement) { described_class.new([])}
  let(:transaction) {double :transaction}

  it 'has an empty statement' do
    expect(statement.transactions).to eq []
  end

  it 'adds new transaction to all time transactions ' do
    statement.add(transaction)

    expect(statement.transactions).to include transaction
  end


  describe "#statement" do
    subject(:statement) { described_class.new([])}

    let(:transaction1) { double :transaction1, date: Time.new(2017, 1, 9),
                                amount: 100,
                                balance: 100 }
    let(:transaction2) { double :transaction2, date: Time.new(2017, 1, 10),
                                amount: -50,
                                balance: 50 }

    it "prints a statement from account transactions" do
      statement.add(transaction1)
      statement.add(transaction2)
      printed_statement =
          "date || credit || debit || balance ||\n"\
      "10/01/2017 || || 50.00 || 50.00 ||\n"\
      "09/01/2017 || 100.00 || || 100.00 ||\n"
      expect(statement.print).to eq printed_statement
    end

  end

end