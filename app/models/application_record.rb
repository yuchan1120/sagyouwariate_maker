class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :owner, ->(user) { where('user_id::text like?', "#{user.id}") }
end
