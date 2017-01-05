require 'spec_helper'
require_relative '../lib/account'

describe Account do

subject(:account) { described_class.new}

  it 'responds to #deposit' do

    expect(account).to respond_to(:deposit).with(1).argument

  end

it 'responds to #widthdraw' do

  expect(account).to respond_to(:withdraw).with(1).argument

end

it 'responds to #statement' do

  expect(account).to respond_to(:statement)

end

  it 'adds deposited amount to the account balance' do
    account.deposit(10)

    expect(account.balance).to eq 10
  end

it 'subtract withdrawn  amount from the account balance' do

  account.withdraw(10)

  expect(account.balance).to eq -10
end

describe "#statement" do
  subject(:statement) { Statement.new([])}


  it 'prints a statement from account transactions with Time.now' do
    account.deposit(10)
    account.deposit(10)
    account.withdraw(10)
    printed_statement =
        "date || credit || debit || balance ||\n#{Time.now.strftime("%d/%m/%Y")} || || 10.00 || 10.00 ||\n#{Time.now.strftime("%d/%m/%Y")} || 10.00 || || 20.00 ||\n#{Time.now.strftime("%d/%m/%Y")} || 10.00 || || 10.00 ||\n"


    expect(account.statement).to eq printed_statement
  end

end

end