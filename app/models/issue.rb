class Issue < ActiveRecord::Base

  has_many :updates

  scope :latest_first, -> { order("created_at DESC") }
end
