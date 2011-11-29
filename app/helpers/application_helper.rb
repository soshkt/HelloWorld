#encoding: utf-8
module ApplicationHelper

  def hStringLessThan(len, str)
    r = str.scan(/./)[0, len].join('')
  end

  def hPhotoTarget( object )
    return nil if current_page? :controller => "moments", :action => "show", :id => object.moment_id
    "_blank"
  end

  def hOpenInNewTab( value, to, *options)
    link_to value, to, :target => "_blank", *options
  end

  def hMomentCreator( object )
    case object.moment_type.to_i
    when 0
      link_to object.creator_name, object.creator, :class => "theme_color"
    when 1
      "主题活动"
    when 2
      "豆瓣活动" 
    else
      "未知Moment分类"
    end
    
  end

  def hPhotoListLink( object )
    return unless object
    str = moment_path(object.moment) unless (current_page?(:controller => "moments", :action => "show", :id => object.moment.id)) 
    (str || "") + "#id=#{object.aid}"
  end

  def hDateRange( object )
    l = hDate object.created_at
    r = hDate object.modified_at

    unless l == r
      l + '-' + r
    else
      l
    end
  end

  def hDate( object )
    object.strftime "%Y.%m.%d" if object.respond_to? :strftime
  end

  def hPhotoLink(f, size = "l")
    path + f.filename + '_' + size
  end

  def hPhoto( object, size = 'l', cls = nil )
    p_photo object, size, cls
    
  end

  def p_photo(f, size = 'l', cls = nil)
    return unless f
    case f.class
    when String
      image_tag path + f + "_#{size}", :class => cls
    else
      image_tag path + f.filename + "_#{size}", :class => cls
    end
  end

  def p_date(f)
    begin
      f.created_at.strftime "%Y-%m-%d"
    rescue
    end
  end

  def hAvatar( object )
    p_avatar object
  end

  def p_avatar(f, flg = nil)
    if f and flg
      str = "<div class='user_avatar'>"
      str += (link_to f do 
        image_tag(path + f.avatar.avatar_file) 
      end).to_s
      str += (render :partial => "misc/profile_box", :locals => {:user => f}).to_s
      str += "</div>"
      raw str
    elsif f
      image_tag(path + f.avatar.avatar_file).to_s
    end

  end

  def path
    "http://vida.fm/pics/"
  end


  def hAuthLink(provider)
    case provider.to_sym
    when :weibo
      "/auth/tsina"
    when :douban
      "/auth/douban"
    end
  end

  def hSinglePhotoClass?(photos)
    return " single" if photos.size == 1
  end


  def hActivityInPageShow(activity_id)
    "#id=" + activity_id.to_s
  end

  def trunc_str(str, length = 7)
    res = str.mb_chars[0, length]
    res += "..." if str.mb_chars.length > length

    res
  end
end
