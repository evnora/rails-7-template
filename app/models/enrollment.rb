class Enrollment < ApplicationRecord
  belongs_to(:course,        counter_cache: true)
  belongs_to(:student,       counter_cache: true)
  has_many(  :incidents,     dependent: :destroy)
end
