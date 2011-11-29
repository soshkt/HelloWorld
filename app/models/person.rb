class Person < ActiveRecord::Base
	# 获取用户最早参与的moment的创建时间，会返回['name', 'created_at', 'avatar_file', 'id', 'first_moment_created_at']
	def self.fetchTimelineInfo(options = {})
		JSON.parse(VIDA.new.call("user/show", {:id => options[:id]}))['data']
	end

	def self.fetch(options = {})
		Person.fetchTimelineInfo(options)
	end
end