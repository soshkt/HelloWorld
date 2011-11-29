class PeopleController < ApplicationController
  def show
    if request.xhr?
      @user =  Person.fetchTimelineInfo(:id => params[:id])
      render :partial => "people/profile_box", :locals => {:user => @user}
      return 
    end

    case params[:v]
    when "mapview"
      redirect_to mapview_person_url(params[:id])
      return
    else "timeline"
      redirect_to timeline_person_url(params[:id])
      return
    end
  end

  def timeline
    @user =  Person.fetchTimelineInfo(:id => params[:id])
    @the_user = Person.fetch(:id => 35)
  end

  def mapview
    @user = Person.fetch(:id => params[:id])
  end

  def setting
  end


end