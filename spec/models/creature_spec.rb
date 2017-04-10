require 'rails_helper'

RSpec.describe Creature do
  context 'validations' do
    it { is_expected.to validate_presence_of :breed }
    it { is_expected.to validate_presence_of :price }

    it { is_expected.to validate_uniqueness_of(:breed).ignoring_case_sensitivity }
  end

  context 'attributes' do
    it 'responds to breed, price, description, image_url' do
      creature = Creature.new

      expect(creature).to respond_to(:breed)
      expect(creature).to respond_to(:price)
      expect(creature).to respond_to(:description)
      expect(creature).to respond_to(:image_url)
    end
  end
end