require 'rails_helper'

RSpec.feature 'User can view categories' do
  context 'There are categories and creatures' do
    attr_reader :category1, :category2, :creatures
    before do
      @category1, @category2 = create_list(:category, 2)
      @creatures = create_list(:creature, 3)
      category1.creatures << creatures[0, 1]
      category2.creatures << creatures.last
    end

    scenario 'User visits /categories' do
      visit root_path

      click_on 'Shop'

      expect(current_path).to eq '/categories'

      within "#category-#{category1.id}" do
        within '.creature-card:first' do
          expect(page).to have_selector "#creature-#{creatures.first.id}"
        end

        within '.creature-card:last' do
          expect(page).to have_selector "#creature-#{creatures[1].id}"
        end

        expect(page).to_not have_selector "#creature-#{creatures.last.id}"
      end

      within "#category-#{category2.id}" do
        within '.creature-card' do
          expect(page).to have_selector "#creature-#{creatures.last.id}"
        end

        expect(page).to_not have_selector "#creature-#{creatures.first.id}"
        expect(page).to_not have_selector "#creature-#{creatures[1].id}"
      end

      with_tag('.creature-card', count: 1)
    end
  end
end

context 'There are no categories' do
  scenario 'User visits /categories' do
    visit categories_path

    within('.categories') do
      expect(page).to have_link count: 0
    end
  end
end
