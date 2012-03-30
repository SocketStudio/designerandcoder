class AddUserIdToDesignerProfiles < ActiveRecord::Migration
  def change
  	add_column :designer_profiles, :user_id, :integer
  end
end
