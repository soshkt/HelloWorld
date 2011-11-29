class User < ActiveRecord::Base
	has_one :avatar

	def avatar_file
		"http://api.vida.fm/pics/#{avatar.avatar_file}"
	end
	
	def self.find_by_ids(friend_ids)
		where(:id => friend_ids)
	end
end