require "VIDA"

#encoding: utf-8
class Moment < ActiveRecord::Base
  def self.recent
    JSON.parse(VIDA.new.call("moment/list_recent"))["data"]
  end

  def self.fetch(id, options = {})
    options.reject! { |key, value| value.nil? } # 清理为空的键值对，因为如果同时出现activity_id和page，服务器不认page。
    
    JSON.parse VIDA.new.call("moment/show/#{id}?page_size=8&offset_padding=0&#{options.to_query}")
  end

  def self.fetch_by_user_id_and_year_and_month(options = {})
    o = {
      :attender => options[:user_id],
      :month => "#{options[:year]}-#{options[:month]}"
    }
    j = JSON.parse VIDA.new.call("moment/list?#{o.to_param}")
  end

  def self.fetch_by_user_id(o = {})
    o = {
      :attender => o.delete(:user_id)
    }
    j = JSON.parse VIDA.new.call("moment/list?#{o.to_param}")
  end
end
