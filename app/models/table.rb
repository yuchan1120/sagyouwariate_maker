class Table < ApplicationRecord
  belongs_to :user
  validates :user_id, numericality: true, presence: true
  scope :search_results, ->(keyword) { where('title like?', "%#{keyword}%") }
end
