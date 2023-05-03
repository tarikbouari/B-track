require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.create(name: 'tarik', email: 'tarikbouari@gmail.com', password: '12345678')
    @group = Group.create(user: @user, name: 'Food', icon: 'fa-solid fa-utensils fa-2x')
    @entity = Entity.create(author: @user, name: 'Chocolate', amount: 10)
  end

  it 'Expense should be valid' do
    expense = Expense.create(group: @group, entity: @entity)
    expect(expense).to be_valid
  end
end