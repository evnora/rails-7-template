class Incident < ApplicationRecord
  belongs_to(:enrollment,  counter_cache: true)
  belongs_to(:behavior,    counter_cache: true)
end
