require 'rails_helper'

RSpec.feature 'User can visit a landing page' do
  context 'The user is not logged in' do
    scenario 'The user visits the root path' do
      visit root_path

      within 'h1' do
        expect(page).to have_content 'Welcome'
      end
      expect(page).to have_button 'Shop'
      expect(page).to have_button 'Login'
      expect(page).to have_link 'Create account'
    end
  end
end
