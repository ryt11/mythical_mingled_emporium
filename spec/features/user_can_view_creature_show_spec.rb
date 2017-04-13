require 'rails_helper'

RSpec.feature 'User can view a creature show page' do
  context 'Where a creature is retired' do
    scenario 'From a past order page' do
      creature = create(:creature)
      creature.retired!
      user = create(:user)
      user.orders << create(:order)
      order = user.orders.first
      order.creatures << (creature(quantity: 1))

      visit order_path(order)

      click_on creature.breed

      expect(current_path).to eq creature_path(creature)

      expect(page).to_not have_button 'Add to Cart'
      axpect(page).to have_content 'Item Retired'
    end
  end
end
