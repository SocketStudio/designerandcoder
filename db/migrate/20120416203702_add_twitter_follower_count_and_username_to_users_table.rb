class AddTwitterFollowerCountAndUsernameToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :twitter_follower_count, :integer
    add_column :users, :twitter_username, :string
  end
end
