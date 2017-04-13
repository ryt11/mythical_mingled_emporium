class Creature < ApplicationRecord
  validates :breed, presence: true
  validates_uniqueness_of :breed, case_sensitive: false
  validates :price, presence: true
  validates :description, presence: true
  validates :image_url, presence: true

  has_many :creatures_categories
  has_many :categories, through: :creatures_categories
  has_many :order_creatures
  has_many :orders, through: :order_creatures
end
