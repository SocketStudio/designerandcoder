class AddFieldsToUser < ActiveRecord::Migration
  def up 
  	add_column :users, :twitter_profile_image_url, :string
  	add_column :users, :twitter_location, :string
  end

  def down
  	remove_colum :users, :twitter_profile_image_url
  	remove_colum :users, :twitter_location, :string
  end
end
