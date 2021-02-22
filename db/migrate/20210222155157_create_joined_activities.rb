class CreateJoinedActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :joined_activities do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
