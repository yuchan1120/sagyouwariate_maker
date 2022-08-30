class Table < ApplicationRecord
  belongs_to :user
  scope :search_results, ->(keyword) { where('title like?', "%#{keyword}%") }
end
