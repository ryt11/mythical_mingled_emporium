require 'rails_helper'

RSpec.feature 'User can view a single orders show page' do
  context 'The user is logged in and has one previous completed order' do
    scenario 'The user can view the details of their past order' do
      user = create :user
      order = create :order
      creature1, creature2 = create_list(:creature, 2)
      OrderCreature.create(order: order, creature: creature1, quantity: 2)
      OrderCreature.create(order: order, creature: creature2, quantity: 2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit orders_path
      click_on order.id

      expect(current_path).to eq(order_path(order))
      expect(page).to have_content("Order Placed On: #{order.created_at}")

      within "li#creature-#{creature1.id}" do
        expect(page).to have_css("img[src*='#{creature1.id}?set']")
        expect(page).to have_link(creature1.breed)
        expect(page).to have_content("Unit Price: $#{creature1.price}0")
        expect(page).to have_content('Quantity: 2')
      end

      expect(page).to have_content("Total: #{order.total}")
      expect(page).to have_content("Status: #{order.status}")
    end
  end
end
