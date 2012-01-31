#encoding: utf-8
class MiscController < ApplicationController

  def index_v2
    if request.url =~ /is_mobile=/i || request.user_agent =~ /(android|ipod|iphone)/i
  		render :partial => "/misc/redirect", :layout => false 
  		return
  	end
    render :layout => false
  end

  def index_v3
    if request.url =~ /is_mobile=/i || request.user_agent =~ /(android|ipod|iphone)/i
      render :partial => "/misc/redirect", :layout => false 
      return
    end
  end

  def about
    @feedback = Feedback.new
  end

  def create_feedback
    Feedback.create(params[:feedback])
    redirect_to :about, :notice => "感谢你的建议,我们将会尽快和你联系"
  end
  
  def android_download
  end
end
