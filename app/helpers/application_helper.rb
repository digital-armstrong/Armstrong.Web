module ApplicationHelper
  include Pagy::Frontend

  def pagination(obj)
    raw(pagy_bootstrap_nav(obj)) if obj.pages > 1
  end

  def formatted_date(param, type)
    unless param.nil?
      I18n.l(param, format: type)
    end
  end

  def full_title(page_title = '')
    base_title = 'ARMStrong'
    if page_title.present?
      "#{page_title} - #{base_title}"
    else
      base_title
    end
  end
end
