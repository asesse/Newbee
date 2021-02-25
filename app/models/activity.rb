class Activity < ApplicationRecord
  has_many :joined_activities
  has_many :messages
  belongs_to :category
  belongs_to :user
  has_many :users, through: :joined_activities
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  
   
  AUTORISATION = ["18-27","28-35","35-45", "45-55","55-85", ""]
  validates :age, inclusion: { in: AUTORISATION }
  LANGUAGE_AUTORISATION = ["french", "english", "dutch", "spanish", ""]
  validates :language, inclusion: { in: LANGUAGE_AUTORISATION }
  GENDER_AUTORISATION = ["male", "female", ""]
  validates :gender, inclusion: { in: GENDER_AUTORISATION }


  def age_valid?(age)
   age_range = self.age.split("-").map{|num| num.to_i}
   age >= age_range[0] && age <= age_range[1] 
  end
  
  def allow?(current_user)
   (self.language == "" || current_user.language == self.language) && (self.gender == "" || current_user.gender == self.gender) && (self.age == "" || age_valid?(current_user.age))
  end 
end
