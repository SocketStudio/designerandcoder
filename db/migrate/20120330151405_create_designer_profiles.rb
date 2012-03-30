class CreateDesignerProfiles < ActiveRecord::Migration
  def change
    create_table :designer_profiles do |t|
      t.string :dribble_profile

      t.timestamps
    end
  end
end
