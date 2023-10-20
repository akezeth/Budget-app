require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) do
    User.new(name: 'Aklilu', email: 'akezeth@gmail.com', password: 'ake123', password_confirmation: 'ake123')
  end
  before { user.save }

  let(:category) { Category.new(name: 'utility', icon: 'utility.svg') }
  before { category.save }

  it 'should contain a name of category' do
    category.name = nil
    expect(category).to_not be_valid
  end

  it 'should contain an icon of category' do
    category.icon = nil
    expect(category).to_not be_valid
  end
end
