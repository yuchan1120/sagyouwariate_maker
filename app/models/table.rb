class Table < ApplicationRecord
  validates :user_id, numericality: true, presence: true
end
