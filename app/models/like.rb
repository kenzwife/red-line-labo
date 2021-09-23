class Like < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  validates_uniqueness_of :tour_id, scope: :user_id
end
