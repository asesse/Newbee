class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :joined_activities
  has_many :activities, through: :joined_activities
  has_many :created_activities, class_name: "Activity"
end
