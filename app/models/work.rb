class Work < ApplicationRecord
  validates :name, presence: true
  validates :time_required, presence: true, numericality: true
  belongs_to :taxon
  belongs_to :user
  scope :category, ->(id) { where('taxon_id::text like?', "#{id}") }
  scope :search_results, ->(keyword) { where('name like?', "%#{keyword}%") }
end
