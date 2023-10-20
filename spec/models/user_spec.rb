require 'rails_helper'

RSpec.describe User, type: :Model do
  let(:user) do
    User.new(name: 'Aklilu', email: 'akezeth@gmail.com', password: 'ake123', password_confirmation: 'ake123')
  end
  before { user.save }

  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'name should be 2 characters and above' do
    user.name = 'A'
    expect(user).to_not be_valid
  end

  it 'name should be 40 characters and less' do
    user.name = 'Ake' * 20
    expect(user).to_not be_valid
  end
end
