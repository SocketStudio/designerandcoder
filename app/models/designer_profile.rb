class DesignerProfile < ActiveRecord::Base
	belongs_to :user

	validates :dribble_profile, :presence=>true
end
