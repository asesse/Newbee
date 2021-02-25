class AddingAgeGenderLanguageToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :age, :string
    add_column :activities, :gender, :string
    add_column :activities, :language, :string
  end
end
