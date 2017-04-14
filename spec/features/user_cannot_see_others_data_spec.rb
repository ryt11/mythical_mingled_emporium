require 'rails_helper'

RSpec.feature 'User is not able to see other users information' do 
  context 'a user is logged in' do 
    before do 
      user1, user2 = create_list(:user, 2)
      @order1, @order2, @order3, @order4 = create_list(:order, 4)
      user1.orders << [@order1, @order2]
      user2.orders << [@order3, @order4]
    end
    scenario 'a user can only see their information' do

      visit orders_path

      within('table.orders') do
        expect(page).to have_content(@order1.id)
        expect(page).to have_content(@order1.total)
      end
      within('table.orders') do
        expect(page).to_not have_content(@order3.id)
        expect(page).to_not have_content(@order3.total)
      end
    end

    visit admin_dashboard_path

    expect(user.admin?).to eq(:false) #check simple data type
    expect(current_path).to_not 

  end
end
