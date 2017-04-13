require 'rails_helper'

RSpec.describe Order do
  context 'validations' do
    it do
      is_expected.to validate_presence_of :contents
      is_expected.to validate_presence_of :total
    end
  end

  context 'attributes' do
    it 'responds to attributes' do
      order = Order.new
      expect(order).to respond_to(:contents)
      expect(order).to respond_to(:total)
      expect(order).to respond_to(:user)

    end
  end

  context 'relationships' do
    it 'belongs to user' do
      user = User.create(username: 'Billybob',
                         email: 'billybob@bbc.com',
                         password: 'hunter2',
                         password_confirmation: 'hunter2',
                         role: 'user')
      order = user.orders.create(contents: 'this has stuff',
                         total: '20.0')
      expect(order.user).to eq(user)
    end
  end
end
