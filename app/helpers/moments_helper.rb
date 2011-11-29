module MomentsHelper
  def hPhotoListClass(photo, selected_photo)
    str = "img_box"
    if photo == selected_photo
      str += " selected"
    end
    str
  end
  def hPhotoListUrl(photo)
    if current_page?(:controller => "moments", :action => "show", :id => photo.photoable_id)
      photo_path(photo)
    else
      moment_path(photo.photoable_id, :acid => photo.aid)
    end
  end

  def hRemote(photo)
    current_page? moment_path(photo.photoable_id)
  end

  def hLikeClass(photo)
    "liked" if @man.like_this? photo
  end

end
