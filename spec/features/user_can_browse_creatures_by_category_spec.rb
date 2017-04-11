require 'rails_helper'

RSpec.feature "User is able to see creatures by category" do 

		scenario "a user visits a category vanity url" do 
			category = create(:category, name: "cute")
			category_two = create(:category, name: "scary")


			creature = create(:creature)
			creature_two = create(:creature)
			creature_three = create(:creature)
			creature_four = create(:creature)


			category.creatures << [creature, creature_two]
			category_two.creatures << [creature_three, creature_four]


			visit "/cute"

      expect(current_path).to eq category_path(category.name)
 			expect(page).to have_link(creature.breed)
 			expect(page).to have_link(creature_two.breed)
 			expect(page).to_not have_link(creature_three.breed)
 			expect(page).to_not have_link(creature_four.breed)
	end
end