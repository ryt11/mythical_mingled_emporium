require 'rails_helper'

RSpec.feature 'User can view a creature show page' do 
  context 'Where a creature is retired' do
    scenario 'From a past order page' do
      # As a user if I visit an item page and that item has been retired
      creature1 = create(:creature)
      # creature1.retired!
      user1 = create(:user)
      order1 = create(:order)
      byebug

      # visit 
      # Then I should still be able to access the item page
      
      # And I should not be able to add the item to their cart
      # And I should see in place of the "Add to Cart" button or link - "Item Retired"

    end
  end
end
