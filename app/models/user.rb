class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :joined_activities
  has_many :activities, through: :joined_activities
  has_many :created_activities, class_name: "Activity"

  after_create :set_age

  def set_age
    self.age = (Date.today - self.birthdate).to_i / 365
    save
  end
end
