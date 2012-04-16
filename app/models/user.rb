class User < ActiveRecord::Base
  
  	has_one :designer_profile
  	has_one :coder_profile
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.set_details(auth)
    end
  end
  
  def set_details(auth)
    self.provider = auth["provider"]
    self.uid = auth["uid"]
    self.name = auth["info"]["name"]
    self.twitter_profile_image_url = auth["info"]["image"]
    self.twitter_location = auth["info"]["location"]
    self.twitter_follower_count=auth["extra"]["raw_info"]["followers_count"]
    self.twitter_username=auth["extra"]["raw_info"]["screen_name"]
    self.twitter_description=auth["extra"]["raw_info"]["description"]
  end
  
  
end
