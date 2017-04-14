require 'rails_helper'

RSpec.feature 'Admin can modify her account' do
  context 'admin is logged in' do
    scenario 'admin modifies her own information' do
      admin = create :user, role: 1

      visit login_path

      fill_in 'session[username]', with: admin.username
      fill_in 'session[password]', with: admin.password

      click_on 'Login'

      expect(current_path).to eq(admin_dashboard_path)

      click_on 'Edit my Info'

      apc = admin.password_confirmation

      expect(current_path).to eq(edit_admin_path)
      expect(find_field('username').value).to eq admin.username
      expect(find_field('email').value).to eq admin.email
      expect(find_field('password').value).to eq admin.password
      expect(find_field('password_confirmation').value).to eq apc

      fill_in 'admin[username]', with: 'WJEJJKERWK'

      click_on 'Update Info'

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content('Username: WJEJJKERWK')
    end

    scenario 'admin cannot modify another users info' do
      admin = create :user, role: 1
      user = create :user

      visit login_path

      fill_in 'session[username]', with: admin.username
      fill_in 'session[password]', with: admin.password

      click_on 'Login'

      expect(current_path).to eq(admin_dashboard_path)

      click_on 'Users'

      expect(current_path).to eq(users_path)

      click_on user.username

      expect(current_path).to eq(user_path(user))

      expect(page).to_not have_link 'Edit my Info'
    end
  end
end
