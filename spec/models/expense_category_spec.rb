require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  let(:user) do
    User.new(name: 'Aklilu', email: 'akezeth@gmail.com', password: 'ake123', password_confirmation: 'ake123')
  end
  before { user.save }

  let(:category) { Category.new(id: 1, name: 'utility', icon: 'utility.svg') }
  before { category.save }

  let(:expense) { Expense.new(id: 1, name: 'water_bill', amount: 100) }
  before { expense.save }

  let(:expense_category) { ExpenseCategory.new(category_id: 1, expense_id: 1) }
  before { expense_category.save }

  it 'should have valid category_id' do
    expense_category.category_id = 2
    expect(expense_category).to_not be_valid
  end

  it 'should have valid expense_id' do
    expense_category.category_id = 3
    expect(expense_category).to_not be_valid
  end
end
