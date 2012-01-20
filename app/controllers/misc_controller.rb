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
    redirect_to :about, :notice => "您的反馈已经如银铃般在我们的耳畔响起，谢谢您对我们的支持和帮助。我们会努力做得更好的！"
  end
  
  def android_download
    render :layout => false
  end
end
