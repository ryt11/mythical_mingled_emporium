require 'rails_helper'

RSpec.feature 'User can view a single orders show page' do
  context 'The user is logged in and has one previous completed order' do
    scenario 'The user can view the details of their past order' do
      user = create :user
      order = create :order
      creature = create :creature
      order.creatures << creature
      user.orders << order
      price = "Total Price: $#{creature1.price.to_f + creature2.price.to_f}0"
      status = "Order Status: Completed on #{order.updated_at}"

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit orders_path
      click_on "li#order-#{order.id}" # this may not work in this format

      expect(current_path).to eq(order_path(order))

      within "ul.creatures li#creature-#{creature.id}" do
        expect(page).to have_content("Order Placed On: #{order.created_at}")
        expect(page).to have_css("img[src*='1?set']")
        expect(page).to have_link(creature.breed)
        expect(page).to have_content("Unit Price: $#{creature1.price}0")
        expect(page).to have_content('Quantity: 1')
        expect(page).to have_content(price)
        expect(page).to have_content(status)
      end
    end
  end
end
