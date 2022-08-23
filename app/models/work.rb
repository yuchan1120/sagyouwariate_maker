class Work < ApplicationRecord
  belongs_to :taxon
  belongs_to :user
  validates :name, presence: true
  validates :time_required, numericality: true, presence: true
  validates :user_id, numericality: true, presence: true
  validates :taxon_id, numericality: true, presence: true
end
