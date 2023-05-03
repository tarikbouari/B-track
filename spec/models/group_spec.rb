require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.create(name: 'tarik', email: 'tarikbouari@gmail.com', password: '12345678')
  end

  it 'Group should be valid' do
    group = Group.create(user: @user, name: 'Food', icon: 'fa-solid fa-utensils fa-2x')
    expect(group).to be_valid
  end

  it 'Group should be invalid' do
    group = Group.create(user: @user, name: '', icon: 'fa-solid fa-utensils fa-2x')
    expect(group).to_not be_valid
    group = Group.create(user: @user, name: 'Food', icon: '')
    expect(group).to_not be_valid
  end

  it 'Group\'s total amount should be equal to 0' do
    group = Group.create(user: @user, name: '', icon: 'fa-solid fa-utensils fa-2x')
    expect(group.total_amount).to eq 0
  end
end
