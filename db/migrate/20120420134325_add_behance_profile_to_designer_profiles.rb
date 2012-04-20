class AddBehanceProfileToDesignerProfiles < ActiveRecord::Migration
  def change
    add_column :designer_profiles, :behance_profile, :string
  end
end
