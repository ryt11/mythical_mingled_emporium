class Creature < ApplicationRecord
  validates :breed, presence: true
  validates_uniqueness_of :breed, case_sensitive: false
  validates :price, presence: true
end