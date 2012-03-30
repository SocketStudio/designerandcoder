class CreateCoderProfiles < ActiveRecord::Migration
  def change
    create_table :coder_profiles do |t|
      t.integer :user_id
      t.string :github_profile

      t.timestamps
    end
  end
end
