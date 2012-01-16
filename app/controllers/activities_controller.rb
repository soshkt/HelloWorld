class ActivitiesController < ApplicationController
  def like
    @activity = Activity.like(:activity_id => params[:id], :user => current_user)
  end

  def likelist
  	@activities = Activity.fetchLikeList(params[:id])
  end
end