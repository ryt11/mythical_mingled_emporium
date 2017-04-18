require 'rails_helper'

RSpec.feature 'Admin edits and creature' do
  context 'as a logged in admin' do
    scenario 'admin can edit the creature details' do
      admin = create(:user, role: 1)
      creature = create(:creature)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_creatures_path

      click_on('Edit')

      expect(current_path).to eq(edit_admin_creature_path(creature))
      within('.creature') do
        expect(page).to have_field(creature[breed])
        expect(page).to have_field(creature[description])
        expect(page).to have_field(creature[image_url])
        expect(page).to have_field(creature[status])

        expect(page).to have_content(creature.breed)
        expect(page).to have_content(creature.description)
        expect(page).to have_css("img[src*='#{creature.id}?set']")
        expect(page).to have_content(creature.status)
      end

      fill_in creature[breed], with: 'Whatisthis'
      fill_in creature[description], with: 'Very angry animal'
      fill_in creature[image_url], with: 'http://bit.ly/2oiL0yl'
      select 'Retired', from: 'status-box'

      within('.creature') do
        expect(page).to have_content('Name: Whatisthis')
        expect(page).to have_content('Description: Very angry animal')
        expect(page).to have_css('img[src=http://bit.ly/2oiL0yl]')
        expect(page).to have_content('Status: Retired')
      end
    end
  end
end
