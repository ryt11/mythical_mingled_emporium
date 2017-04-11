require 'rails_helper'

RSpec.feature "User is able to add items to cart" do
  context "User is not logged in" do
    scenario "a user adds an item to their cart" do
      creature1, creature2 = create_list(:creature, 2)

      visit '/creatures'

      within "li#creature-#{creature1.id}" do
        click_on "Add to Cart"
      end
      within "li#creature-#{creature2.id}" do
        click_on "Add to Cart"
      end
      within "div.nav" do
        click_on "View Cart"
      end

      expect(current_path).to eq(carts_path)

      save_and_open_page
      expect(page).to have_css("img[src*='0.png']")
      expect(page).to have_content("Breed: #{creature1.breed}")
      expect(page).to have_content("Description: #{creature1.description}")
      expect(page).to have_content("Price: #{creature1.price}")
      expect(page).to have_content("Total Price: #{creature1.price.to_f + creature2.price.to_f}")


      # And my current path should be "/cart"
      # And I should see a small image, title, description and price for the item I just added
      # And there should be a "total" price for the cart that should be the sum of all items in the cart
    end
  end
end
