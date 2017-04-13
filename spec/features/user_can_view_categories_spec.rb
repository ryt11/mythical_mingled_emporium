require 'rails_helper'

RSpec.feature 'User can view categories' do
  context 'There are categories' do
    scenario 'User visits /categories' do
      c1, c2 = create_list(:category, 2)

      visit categories_path

      expect(current_path).to eq '/categories'

      within('ul.categories') do
        expect(page).to have_link c1.name
        expect(page).to have_link c2.name
        expect(page).to have_selector('li', count: 2)
      end
    end
  end

  context 'There are no categories' do
    scenario 'User visits /categories' do
      visit categories_path

      within('ul.categories') do
        expect(page).to have_selector('li', count: 0)
      end
    end
  end
end
