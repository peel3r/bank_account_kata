require 'spec_helper'
require_relative '../lib/transaction'

describe Transaction do

  subject(:transaction) {described_class.new(90, Time.new(2017, 1, 05), 10)}

  it 'has a transaction date' do
    expect(transaction.date.year).to eq 2017
  end

  it 'has a transaction amount' do
    expect(transaction.amount).to eq 90
  end

  it 'has a transaction balance' do
    expect(transaction.balance).to eq 10
  end

end