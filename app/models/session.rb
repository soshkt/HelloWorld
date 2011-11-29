class Session
	def self.create(options = {})
		user = JSON.parse(VIDA.new.call("account/signup_with_vendors", options))['user']
		user['avatar_file'] = user['avatar'] # hack for issue#12

		user
	end
end
