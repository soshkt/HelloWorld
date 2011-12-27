class MomentsController < ApplicationController
  def show
    if request.url =~ /is_mobile=/i || request.user_agent =~ /(android|ipod|iphone)/i
       render :partial => "/misc/redirect", :layout => false 
       return
    end
    @moment = Moment.fetch(params[:id], :activity_id => params[:activity_id], :page => params[:page])
    @moment['current_page'] = 0 if @moment['current_page'].to_i == -1 # 如果没有找到activity，后台返回当前页数是-1  
  end
end
