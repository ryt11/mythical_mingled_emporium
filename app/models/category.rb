class Category < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false
  has_many :creatures_categories
  has_many :creatures, through: :creatures_categories
end
