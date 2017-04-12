require 'rails_helper'

RSpec.feature 'User is able to add items to cart' do
  context 'User is not logged in' do
    scenario 'a user adds an item to their cart' do
      creature1, creature2 = create_list(:creature, 2)

      visit '/creatures'

      within "li#creature-#{creature1.id}" do
        click_on 'Add to Cart'
      end
      within "li#creature-#{creature2.id}" do
        click_on 'Add to Cart'
      end
      within 'div.nav-wrapper' do
        click_on 'View Cart'
      end

      expect(current_path).to eq(carts_path)

      expect(page).to have_css("img[src*='1?set']")
      expect(page).to have_content("Breed: #{creature1.breed}")
      expect(page).to have_content("Description: #{creature1.description}")
      expect(page).to have_content("Price: $#{creature1.price}0")
      expect(page).to have_content("Total Price: $#{creature1.price.to_f + creature2.price.to_f}0")
    end
  end
end
