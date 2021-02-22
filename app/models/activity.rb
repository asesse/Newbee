class Activity < ApplicationRecord
  has_many :joined_activities
  belongs_to :category
  belongs_to :user
  has_many :users, through: :joined_activities
end
