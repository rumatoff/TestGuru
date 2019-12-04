class Feedback < ApplicationRecord
  self.table_name = 'feedback'

  validates :name, presence: true
end
