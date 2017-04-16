class CreaturesCategory < ApplicationRecord
  belongs_to :category
  belongs_to :creature
end
