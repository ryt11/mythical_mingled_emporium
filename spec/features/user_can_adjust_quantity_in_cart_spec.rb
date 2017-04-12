require 'rails_helper'

RSpec.feature 'User can adjust quantity' do
  context 'user is not logged in and there is at least one item in the cart' do
    attr_reader :creature1

    before do
      @creature1 = create(:creature)
      @creature2 = create(:creature)

      visit '/creatures'
       within("li#creature-#{@creature1.id}") do
        click_on 'Add to Cart'
        click_on 'Add to Cart'
      end
      within("li#creature-#{@creature2.id}") do
        click_on 'Add to Cart'
      end
      visit cart_path
    end

    scenario 'user increases cart quantity' do
      within("li#cart-creature-#{@creature1.id}") do
        expect(page).to have_content('Quantity: 2')
        click_on 'Increase Quantity'
        expect(current_path).to eq '/cart'
        expect(page.body).to have_content('Quantity: 3')
        expect(page.body).to have_content('Price: 30.0')
      end
      within('div.cart-total') do
        expect(page).to have_content('Total Price: 40.0')
      end
    end
    scenario 'user decreases cart quantity' do

      within("li#cart-creature-#{@creature1.id}") do
        expect(page).to have_content('Quantity: 2')
        click_on 'Decrease Quantity'
        expect(current_path).to eq '/cart'
        expect(page.body).to have_content('Quantity: 1')
        expect(page.body).to have_content('Price: 10.0')
      end
      within('div.cart-total') do
        expect(page).to have_content('Total Price: 20.0')
      end
    end
  end
end
