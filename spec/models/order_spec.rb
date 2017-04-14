require 'rails_helper'

RSpec.describe Order do
  context 'validations' do
    it do
      is_expected.to validate_presence_of :total
      is_expected.to validate_presence_of :status
    end
  end

  context 'attributes' do
    it 'responds to attributes' do
      order = Order.new
      expect(order).to respond_to(:total)
      expect(order).to respond_to(:user)
      expect(order).to respond_to(:status)
    end
  end

  context 'relationships' do
    it 'belongs to user' do
      user = User.create(username: 'Billybob',
                         email: 'billybob@bbc.com',
                         password: 'hunter2',
                         password_confirmation: 'hunter2',
                         role: 'user')
      user.orders.create(total: '20.0',
                         status: 'completed')
    end
    it 'has many creatures' do
      user = User.create(username: 'Billybob',
                         email: 'billybob@bbc.com',
                         password: 'hunter2',
                         password_confirmation: 'hunter2',
                         role: 'user')
      order = user.orders.create(total: '20.0',
                                 status: 'completed')
      creature1, creature2 = create_list(:creature, 2)
      OrderCreature.create(order: order, creature: creature1, quantity: 2)
      OrderCreature.create(order: order, creature: creature2, quantity: 2)
      expect(order.creatures).to eq([creature1, creature2])
    end
  end

  context 'enums' do
    before :each do
      user = create :user
      @order = user.orders.create(total: '10.0')
    end

    it 'has a default status' do
      expect(@order).to respond_to :status
      expect(@order.status).to eq 'ordered'
    end

    it 'its status can be ...' do
      @order.paid!
      expect(@order.status).to eq 'paid'
      @order.cancelled!
      expect(@order.status).to eq 'cancelled'
      @order.completed!
      expect(@order.status).to eq 'completed'
    end
  end
end
