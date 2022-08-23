class Table < ApplicationRecord
  belongs_to :user
  validates :user_id, numericality: true, presence: true
end
