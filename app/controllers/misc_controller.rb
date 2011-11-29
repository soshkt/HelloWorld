#encoding: utf-8
class MiscController < ApplicationController
  caches_page :about, :setting

  def index_v3
  	if request.url =~ /is_mobile=/i || request.user_agent =~ /(android|ipod|iphone)/i
  		render :partial => "/misc/redirect", :layout => false
  		return
  	end
    render :layout => false
  end
  def index_v2
    p @current_user
    if request.url =~ /is_mobile=/i || request.user_agent =~ /(android|ipod|iphone)/i
  		render :partial => "/misc/redirect", :layout => false 
  		return
  	end
    render :layout => false
  end

  def setting
  end

  def about
    @feedback = Feedback.new
  end

  def create_feedback
    Feedback.create(params[:feedback])
    redirect_to :about, :notice => "您的反馈已经如银铃般在我们的耳畔响起，谢谢您对我们的支持和帮助。我们会努力做得更好的！"
  end

  def popover_text
    Struct.new("Text", :first_section, :second_section)
    case params[:campaign_id]
    when 'lirikos'
      render :json => Struct::Text.new("我正在参加#LIRIKOS深海美肌之约#", "点击[喜欢]为我投票吧") and return
    when 'avis'
    when 'song'
      render :json => Struct::Text.new("我正在参加#VIDA新年礼物拍就送#", "点击[喜欢]为我投票吧") and return
    when 'default'
      render :json => Struct::Text.new("正在使用VIDA分享生活", "点击[喜欢]支持一下") and return
    end
  end

end
