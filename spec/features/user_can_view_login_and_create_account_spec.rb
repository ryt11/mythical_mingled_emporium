require 'rails_helper'

RSpec.feature 'User can login successfully' do
  context 'User is a visitor' do
    scenario 'User can view a login form page' do
      visit root_path

      click_on 'Login'

      expect(current_path).to eq '/login'
      expect(page).to has_field?('user[username]')
      expect(page).to has_field?('user[password]')
      expect(page).to has_field?('user[password_confirmation]')
      expect(page).to have_button('Create Account')
    end

    scenario 'User can create a new account' do
      visit '/login'
      click_on 'Create Account'
      fill_in 'user[username]', with: 'Billybob'
      fill_in 'user[email]', with: 'billybob@bbc.com'
      fill_in 'user[password]', with: 'hunter2'
      fill_in 'user[password_confirmation]', with: 'hunter2'
      click_on 'Sign Up!'
      expect(current_path).to eq '/dashboard'
      within('div.nav-wrapper') do
        expect(page).to have_content('Logged in as Billybob')
      end

      within('div.profile_info') do
        expect(page).to have_content('Username: Billybob')
        expect(page).to have_content('Email: billybob@bbc.com')
      end
      expect(page).to_not have_button("Login")
      expect(page).to have_button("Logout")
    end
  end
end
