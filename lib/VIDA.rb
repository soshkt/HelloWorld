class VIDA
	def call(methods, *options)
		params = options[0]
		user = options[1] 
		resource = "'#{api_url}/#{methods}'"
		cmd = "curl -A 'Platform/web' -d '#{params.to_param}' "
		cmd += "-s "
		cmd += "-u #{user[:token]}:#{user[:secret]} " if user
		cmd += resource
		`#{cmd}`
	end

	def api_url
		"http://api.vida.fm"
	end
end