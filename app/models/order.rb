class Order < ApplicationRecord
  belongs_to :user
  has_many :order_creatures
  has_many :creatures, through: :order_creatures
  validates :total, presence: true
  validates :status, presence: true
end
