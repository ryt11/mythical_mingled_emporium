require 'rails_helper'

RSpec.describe Cart do
	context 'attributes' do
		it 'responds to name' do
			cart = Cart.new({})

			expect(cart).to respond_to(:creatures)
		end
	end

  context 'relationships' do
    it 'has many creatures' do
      cart = Cart.new({})
      creatures = create_list(:creature, 2)

      cart.add_creature(creatures[0].id)
      cart.add_creature(creatures[1].id)

      expect(cart.creatures).to eq(creatures)
    end
  end

  context "Methods" do
    it "can calculate the total number of creatures in it" do
      cart = Cart.new({"1" => 2, "2" => 3})

      expect(cart.total_count).to eq(5)
    end

    it "can add an creature to its contents" do
      cart = Cart.new({"1" => 1})

      cart.add_creature(1)
      cart.add_creature(2)

      expect(cart.contents).to eq({"1" => 2, "2" => 1})
    end

    it "can get total price" do
      cart = Cart.new({})
      creatures = create_list(:creature, 2)

      cart.add_creature(creatures[0].id)
      cart.add_creature(creatures[1].id)

      expect(cart.total_price).to eq(20.00)
    end

    it "can report on how many of a particular creature it has" do
      cart = Cart.new({"1" => 3, "2" => 1})

      expect(cart.count_of(1)).to eq(3)
    end
  end
end
