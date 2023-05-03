require 'rails_helper'

RSpec.describe User, type: :model do
  it 'User should be valid' do
    user = User.create(name: 'tarik', email: 'tarikbouari@gmail.com', password: '12345678')
    expect(user).to be_valid
  end

  it 'User should be invalid' do
    user = User.create(name: '', email: 'tarikbouari@gmail.com', password: '12345678')
    expect(user).to_not be_valid
    user = User.create(name: 'tarik', email: '', password: '1234567')
    expect(user).to_not be_valid
    user = User.create(name: 'tarik', email: 'tarikbouari@gmail.com', password: '12345')
    expect(user).to_not be_valid
  end
end