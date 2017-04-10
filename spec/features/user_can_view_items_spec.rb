require 'rails_helper'

RSpec.feature 'User can view creatures' do
  context 'There are creatures' do
    scenario 'User visits /creatures' do
      c1, c2 = create_list(:creature, 2)
      visit creatures_path

      expect(current_path).to eq '/creatures'

      expect(page).to have_link c1.name
      expect(page).to have_link c2.name
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
