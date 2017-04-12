require 'rails_helper'

RSpec.feature "User can login successfully" do 
  scenario "User can view a login form page" do 
    context "User is a visitor" do
    visit "/"
    click_on "Login"
      expect(current_path).to eq "/login"
      expect(page).to has_field?('user[username]')
      expect(page).to has_field?('user[password]')
      expect(page).to has_field?('user[password_confirmation'])
      expect(page).to have_button('Create Account')
    end
  end
end
