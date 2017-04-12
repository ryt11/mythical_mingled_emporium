require 'rails_helper'

RSpec.feature 'User can view past orders' do
  context 'an exisiting user, who has orders' do
    attr_reader :order1, :order2

    before do
      user = create(:user)
      @order1, @order2 = create_list(:order, 2)
      user.orders << [order1, order2]

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit orders_path
    end

    scenario 'can see a page with all their past orders' do
      within('ul.orders') do
        within("li#order-#{order1.id}") do
          expect(page).to have_content(order1.id)
          expect(page).to have_content(order1.created_at)
          expect(page).to have_content(order1.total_price)
        end

        within("li#order-#{order2.id}") do
          expect(page).to have_content(order2.id)
          expect(page).to have_content(order2.created_at)
          expect(page).to have_content(order2.total_price)
        end
      end
    end

    scenario 'can click a list item to link to the past order' do
      within('ul.orders') do
        click_on("li#order-#{order1.id}") # not sure if this will work -
        # would like to make whole li element a link.
        # http://stackoverflow.com/questions/24384845/capybara-clicking-on-some-element-that-is-very-similar-to-other-one
        # http://stackoverflow.com/questions/13745347/make-whole-li-as-link-with-proper-html

        expect(current_path).to eq(order_path(order1))
      end
    end
  end
end
