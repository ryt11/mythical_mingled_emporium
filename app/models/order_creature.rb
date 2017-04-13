class OrderCreature < ApplicationRecord
  belongs_to :order
  belongs_to :creature 
  validates :quantity, presence: true
end