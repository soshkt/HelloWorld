class Activity < ActiveRecord::Base
  def self.like(options = {})
    options[:user].symbolize_keys!
    JSON.parse(VIDA.new.call("moment/like", {:activity_id => options[:activity_id]}, {:token => options[:user][:token], :secret => options[:user][:secret]}))["data"]
  end
end
