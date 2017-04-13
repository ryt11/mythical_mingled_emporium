require 'rails_helper'

RSpec.feature 'User can check out' do
  context 'an unlogged in, existing user' do
    scenario 'adds creatures, goes to cart, logs in, and checks out' do
      user = create(:user)
      creature1, creature2 = create_list(:creature, 2)
      visit creatures_path

      within "li#creature-#{creature1.id}" do
        click_on 'Add to Cart'
      end
      within "li#creature-#{creature2.id}" do
        click_on 'Add to Cart'
      end
      within 'div.nav-wrapper' do
        click_on 'View Cart'
      end

      expect(current_path).to eq(cart_path)

      click_on 'Login'

      fill_in 'session[username]', with: user.username
      fill_in 'session[password]', with: user.password

      click_on 'Login'

      expect(current_path).to eq dashboard_path

      click_on 'View Cart'

      expect(current_path).to eq cart_path

      click_on 'Checkout'

      expect(current_path).to eq orders_path
      within('div.flash') do
        expect(page).to have_content('Order was successfully placed')
      end

      time = Order.last.created_at.strftime('%b %e, %l:%M %p')
      within('table.orders') do
        expect(page).to have_link("Order #: #{Order.last.id}")
        expect(page).to have_content("Ordered on: #{time}")
        expect(page).to have_content("Total: $#{Order.last.total}0")
      end
    end
  end
end
# issueTwelve:
#   title: Checking out
#   body: >
#     Background: An existing user and a cart with items
#
#     As a visitor
#     When I add items to my cart
#     And I visit "/cart"
#     And I click "Login or Register to Checkout"
#     Then I should be required to login
#
#     When I am logged in
#     And I visit my cart
#     And when I click "Checkout"
#     Then the order should be placed
#     And my current page should be "/orders"
#     And I should see a message "Order was successfully placed"
#     And I should see the order I just placed in a table
