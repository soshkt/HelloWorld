class ActivitiesController < ApplicationController
  def like
    @activity = Activity.like(:activity_id => params[:id], :user => current_user)
  end
end