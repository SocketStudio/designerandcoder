class AddTwitterDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_description, :text
  end
end
