require 'rails_helper'

RSpec.feature 'Admin orders' do
  context 'As an admin, and there are existing orders' do
    attr_reader :admin, :orders

    before do
      @admin = create :user, role: 1
      @orders = create_list :order, 10
      orders[4..6].each(&:paid!)
      orders[7..8].each(&:cancelled!)
      orders[9].completed!

      visit login_path

      fill_in 'session[username]', with: admin.username
      fill_in 'session[password]', with: admin.password

      click_on 'Login'

      expect(current_path).to eq admin_dashboard_path

      click_on 'Orders'

      expect(current_path).to eq orders_path
    end

    scenario 'Admin views all orders' do
      expect(page).to have_link("Order #: #{orders.first.id}")
    end

    scenario 'See total number of orders for each status' do
      expect(page).to have_content('Ordered: 4')
      expect(page).to have_content('Paid: 3')
      expect(page).to have_content('Cancelled: 2')
      expect(page).to have_content('Completed: 1')
    end

    scenario 'Filter orders by status type' do
      click_on 'Paid'

      expect(page).to have_link("Order #: #{orders[4].id}")
      expect(page).to_not have_link("Order #: #{orders[0].id}")

      click_on 'Cancelled'

      expect(page).to have_link("Order #: #{orders[8].id}")
      expect(page).to_not have_link("Order #: #{orders[4].id}")

      click_on 'Completed'

      expect(page).to have_link("Order #: #{orders[9].id}")
      expect(page).to_not have_link("Order #: #{orders[8].id}")

      click_on 'View All'

      expect(page).to have_link("Order #: #{orders[9].id}")
      expect(page).to have_link("Order #: #{orders[8].id}")
      expect(page).to have_link("Order #: #{orders[6].id}")
      expect(page).to have_link("Order #: #{orders[3].id}")
    end

    scenario 'Update order status through links' do
      within 'order-<%= order[1].id%>' do
        expect(page).to have_link 'Cancel'
        expect(page).to have_content 'Status: Ordered'

        click_on 'Mark as paid'

        expect(current_path).to eq orders_path
        expect(page).to have_content 'Status: Paid'

        expect(order[1].status).to eq 'paid'
      end

      within 'order-<%= order[2].id%>' do
        click_on 'Cancel'

        expect(current_path).to eq orders_path
        expect(page).to have_content 'Status: Cancelled'

        expect(order[2].status).to eq 'cancelled'
      end

      within 'order-<%= order[4].id%>' do
        expect(page).to have_link 'Cancel'
        expect(page).to have_content 'Status: Paid'

        click_on 'Mark as completed'

        expect(current_path).to eq orders_path
        expect(page).to have_content 'Status: Completed'

        expect(order[4].status).to eq 'completed'
      end

      within 'order-<%= order[5].id%>' do
        click_on 'Cancel'

        expect(current_path).to eq orders_path

        expect(order[5].status).to eq 'cancelled'
      end

      within 'order-<%= order[7].id%>' do
        expect(page).to_not have_link 'Cancel'
        expect(page).to_not have_link 'Mark as completed'
        expect(page).to_not have_link 'Mark as cancelled'
      end

      within 'order-<%= order[9].id%>' do
        expect(page).to_not have_link 'Cancel'
        expect(page).to_not have_link 'Mark as completed'
        expect(page).to_not have_link 'Mark as cancelled'
      end
    end
  end
end
