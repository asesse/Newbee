class JoinedActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  STATUS = ["Pending", "Accepted", "Rejected"]
  validates :status, inclusion: { in: STATUS }
end
