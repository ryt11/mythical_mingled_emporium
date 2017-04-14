require 'rails_helper'

RSpec.feature 'Unauthenticated user permissions' do
  context 'a user is not logged in' do
    before do
      user1 = create(:user)
      @order1, @order2, @order3, @order4 = create_list(:order, 4)
      user1.orders << [@order1, @order2]
    end

    scenario 'a user can only see their information' do
      visit orders_path

      within('table.orders') do
        expect(page).to_not have_content(@order1.id)
        expect(page).to_not have_content(@order2.id)
        expect(page).to_not have_content(@order3.id)
      end
    end

    scenario 'a user cannot view admin dashboard' do
      visit admin_dashboard_path

      expect(response).to have_http_status(404)
      expect(page).to_not have_content('Admin Dashboard')
    end

    scenario 'will be redirected to login/create account when they checkout' do
      visit cart_path

      click_on 'Checkout' # We will have to change the previous test that makes
                          # it so that it doesnt exists
      expect(current_path).to eq(login_path)
      expect(page).to have_content('Login or create an account to checkout')
    end
  end
end
