class Activity < ApplicationRecord
  has_many :joined_activities
  belongs_to :category
  belongs_to :user
  has_many :users, through: :joined_activities
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
