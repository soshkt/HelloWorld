class MomentsController < ApplicationController
  layout  "moment_show"

  def show
    if request.url =~ /is_mobile=/i || request.user_agent =~ /(android|ipod|iphone)/i
       render :partial => "/misc/redirect", :layout => false 
       return
    end
    @moment = Moment.fetch(params[:id], :activity_id => params[:activity_id], :page => params[:page])
    @moment['current_page'] = 0 if @moment['current_page'].to_i == -1 # 如果没有找到activity，后台返回当前页数是-1  
    puts @moment
  end
  

  def explore
    @moments = Moment.recent
  end

  def index
    @moments = Moment.fetch_by_user_id_and_year_and_month(:user_id => params[:person_id], :year => params[:year], :month => params[:month])
  end

  def location
    render :json => Moment.fetch_by_user_id(:user_id => params[:person_id], :page_size => 10, :offset_padding => 0)
  end
end
