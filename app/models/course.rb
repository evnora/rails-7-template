class Course < ApplicationRecord
  # correct – dependent is a keyword, not a positional Hash
  has_many :enrollments, dependent: :destroy
end
