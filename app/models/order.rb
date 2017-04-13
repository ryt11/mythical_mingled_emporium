class Order < ApplicationRecord
  belongs_to :user
  has_many :order_creatures
  has_many :creatures, through: :order_creatures
  validates :total, presence: true
  validates :status, presence: true

  enum status: %w(ordered paid cancelled completed)
end
