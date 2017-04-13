require 'rails_helper'

RSpec.describe User do
  context 'validations' do
    it do
      is_expected.to validate_presence_of :username
      is_expected.to validate_presence_of :email
      is_expected.to validate_presence_of :password
      is_expected.to validate_presence_of :password_confirmation
      is_expected.to validate_uniqueness_of(:username).ignoring_case_sensitivity
    end
  end

  context 'attributes' do
    it 'responds to name' do
      user = User.new

      expect(user).to respond_to(:username)
      expect(user).to respond_to(:email)
      expect(user).to respond_to(:password)
      expect(user).to respond_to(:role)
      expect(user).to respond_to(:orders)
    end
  end

  context 'relationships' do
    it 'has many orders' do
      user = User.create(username: 'Billybob',
                         email: 'billybob@bbc.com',
                         password: 'hunter2',
                         password_confirmation: 'hunter2',
                         role: 'user')

      orders = create_list(:order, 2, user: user)
      user.orders << orders

      expect(user.orders).to eq(orders)
    end
  end
end
