class Comment < ActiveRecord::Base

  def self.fetchPeer(options = {})
  	o = {
  		:type => 'Activity',
  		:type_id => options[:activity_id], 
  	}

  	JSON.parse VIDA.new.call("comment/list?#{o.to_param}")
  end


  # 创建完评论返回评论相对应的activity，但是comment只返回最后五个。
  def self.create(options = {})
  	options[:user].symbolize_keys!
  	JSON.parse(VIDA.new.call("comment/add", {:type => "Activity", :type_id => options[:activity_id], :content => options[:content]}, {:token => options[:user][:token], :secret => options[:user][:secret]}))["data"]
  end
end
