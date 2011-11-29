#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user
  before_filter :record_browse_histories if Rails.env.production?

  def record_browse_histories
    b = BrowseHistory.new
    b.uu_user_id = uu_user_id
    b.user_id = session[:current_user]['id'] if session[:current_user].present?
    b.referer = request.referer.slice(0, 350) if !request.referer.blank?
    b.agent = request.user_agent.slice(0, 480) if !request.user_agent.blank?
    b.url = request.fullpath.slice(0, 350) if !request.fullpath.blank?
    if !params.blank?
      b.params = params[:id]
    end
    b.ip = request.remote_ip
    b.save    
  end

  def uu_user_id
    cookies.permanent[:uu_user_id] = nonce if cookies[:uu_user_id].nil?
    cookies[:uu_user_id]
  end

  def current_user
    return nil unless session[:current_user]
    # 不知道为何有时候keys会变成symbol，这里做个hack
    @current_user = session[:current_user].stringify_keys!
  end

  private

  def nonce
    rand(10 ** 30).to_s.rjust(30,'0')
  end

end