require 'rails_helper'

RSpec.feature 'User can view creatures' do
  context 'There are creatures' do
    scenario 'User visits /creatures' do
      c1, c2 = create_list(:creature, 2)

      visit creatures_path

      expect(current_path).to eq '/creatures'

      save_and_open_page

      within('ul.creatures') do
        expect(page).to have_link c1.breed
        expect(page).to have_link c2.breed
        expect(page).to have_selector('li', count: 2)
      end
    end
  end

  context 'There are no creatures' do
    scenario 'User visits /creatures' do
      visit creatures_path

      within('ul.creatures') do
        expect(page).to have_selector('li', count: 0)
      end
    end
  end
end
