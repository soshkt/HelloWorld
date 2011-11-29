# encoding: utf-8
class FriendsController < ApplicationController
	layout :nil

	def index
		friend_ids = cookies[:friends].split(',') if cookies[:friends]
		@friends = User.find_by_ids friend_ids
	end

	def create
		if cookies[:friends].nil? or not(cookies[:friends].split(',').include? params[:friend_id])
			if cookies[:friends].nil?
				cookies[:friends] = params[:friend_id]
			else
				cookies[:friends] += ",#{params[:friend_id]}"
			end

			@friend = User.find_by_id params[:friend_id]
		else
			flash[:error] = '已经添加该好友。'
		end
	end
end
