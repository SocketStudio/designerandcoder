class AddStackoverflowProfileToCoderProfiles < ActiveRecord::Migration
  def change
    add_column :coder_profiles, :stackoverflow_profile, :string
  end
end
