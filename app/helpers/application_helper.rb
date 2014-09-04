module ApplicationHelper
  
  def bs_icon(name, text)
    "<span class='glyphicon glyphicon-#{name}'></span> #{text}".html_safe
  end
  
  def bs_badge(text)
    "<span class='badge'>#{text}</span>".html_safe
  end
  
  def bs_label(text, type = 'default')
    "<span class='label label-#{type}'>#{text}</span>".html_safe
  end
  
  def full_title(page_title)
    base_title = t 'app.title'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
end
