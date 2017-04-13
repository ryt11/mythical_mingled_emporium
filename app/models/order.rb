class Order < ApplicationRecord
  belongs_to :user
  validates :contents, presence: true
  validates :total, presence: true
end
