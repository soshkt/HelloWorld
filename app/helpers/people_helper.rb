#encoding: utf-8
module PeopleHelper
  def empty_timeline_items(num, comment = nil)
    raw "<span class='timeline_item'><!--#{comment}--></span>" * num
  end

  def isWorldEnd?(y, m)
    raw "<!-- BOOM!!BOOM!! 人类被拯救啦！世界毁灭啦！ -->" if y == 2012 and m == 12
  end

  def selected?(date, photos_num)
    if date.strftime("%Y.%m").gsub(/-0(\d)/, '-\1') == photos_num.to_a.last[0]
      " selected" 
    end
  end

  def empty? num
    " empty" if num.blank?
  end


  def timeline_items(first_moment_created_at)
    return if first_moment_created_at.nil?
    i = Time.parse first_moment_created_at
    str = ''
    while i <= Time.current.end_of_month do
      str += (link_to i.strftime("%Y.%m").gsub(/\.0/, '.'), "#year=#{i.year}&month=#{i.month}", :class => "timeline_item")
      i = i.next_month
    end

    raw str
  end
end
