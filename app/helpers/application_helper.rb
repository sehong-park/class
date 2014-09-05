module ApplicationHelper

  def bs_validation_message(attribute, errors)
    "<span class='help-block text-muted'>#{errors.get(attribute)[0]}</span>".html_safe
  end

  def bs_validation(attribute, model)
    if model.errors.has_key?(attribute)
      "has-error has-feedback" 
    else
      if model.errors.any?
        model.read_attribute(attribute).blank? ? "has-warning has-feedback" : "has-success has-feedback"
      end
    end
  end

  def bs_validation_icon(attribute, model)
    if model.errors.has_key?(attribute)
      bs_icon(:remove, "form-control-feedback")
    else
      if model.errors.any?
        model.read_attribute(attribute).blank? ? bs_icon(:"warning-sign", "form-control-feedback") : bs_icon(:ok, "form-control-feedback")
      end
    end
  end

  def bs_icon(icon_name, class_attrs = "")
    "<span class='glyphicon glyphicon-#{icon_name} #{class_attrs}'></span>".html_safe
  end

  def bs_icon_with_text(icon_name, text)
    "#{bs_icon(icon_name)} #{text}".html_safe
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
