require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) do
    User.new(name: 'Aklilu', email: 'akezeth@gmail.com', password: 'ake123', password_confirmation: 'ake123')
  end
  before { user.save }

  let(:expense) { Expense.new(name: 'water_bill', amount: 100) }
  before { expense.save }

  it 'should have a name attribute' do
    expense.name = nil
    expect(expense).to_not be_valid
  end

  it 'should have a name attribute length of 2 characters or greater' do
    expense.name = 'w'
    expect(expense).to_not be_valid
  end

  it 'should have amount attribute' do
    expense.amount = nil
    expect(expense).to_not be_valid
  end

  it 'amount should be an integer' do
    expense.amount = 'cosy'
    expect(expense).to_not be_valid
  end
end
