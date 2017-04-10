require 'rails_helper'

RSpec.describe Creature do
  context 'validations' do
    it { is_expected.to validate_presence_of :breed }
    it { is_expected.to validate_presence_of :price }

    it { is_expected.to validate_uniqueness_of :breed }
  end
end