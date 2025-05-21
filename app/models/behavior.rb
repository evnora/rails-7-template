class Behavior < ApplicationRecord
  has_many(:incidents, dependent: :destroy)
end
