class CommentsController < ApplicationController
  def create
    @activity = Comment.create(:activity_id => params[:activity_id], :content => params[:content], :user => current_user) # 创建完评论返回评论相对应的activity，但是comment只返回最后五个。
  end

  def index
    @comments = Comment.fetchPeer(:activity_id => params[:activity_id])
  end
end