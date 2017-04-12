require 'rails_helper'

RSpec.feature 'Guest user cart functionality' do 
  scenario 'a guest user needs to login before checkout when items in cart' do
    # As a visitor when I have items in my cart
    creature1, creature2 = create_list(:creature, 2)
    visit '/creatures'

    within "li#creature-#{creature1.id}" do
      click_on 'Add to Cart'
    end
    within "li#creature-#{creature2.id}" do
      click_on 'Add to Cart'
    end
    visit '/cart'
    # And when I visit "/cart"
    expect(page).to have_content("Breed: #{creature1.breed}")
    expect(page).to have_content("Breed: #{creature2.breed}")
    expect(page).to_not have_button 'Checkout'
    # I should not see an option to "Checkout"
    expect(page).to have_link('Login or Create Account to Checkout')
    # I should see an option to "Login or Create Account to Checkout"
    # After I create an account
    User.create(name:'Billy', email: 'billy@billy.com', password: 'hunder3')
    # And I visit "/cart
    visit '/cart'
    # Then I should see all of the data that was there when I was not logged in
    expect(page).to have_content("Breed: #{creature1.breed}")
    expect(page).to have_content("Breed: #{creature2.breed}")
    # When I click "Logout"
    click_on 'Logout'
    # Then I should see see "Login"
    expect(page).to have_button('Login')
    expect(page).to_not have_button('Logout')

    # And I should not see "Logout"

  end
end