class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def formatted_date(param, type)
    unless param.nil?
      I18n.l(param, format: type)
    end
  end
end
