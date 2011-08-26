module ApplicationHelper

  def google_javascript_include_tag
    if ENV['RAILS_ENV'] == 'production'
      js += '<script src="' + request.protocol + 'ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js?ver=1.4.2" type="text/javascript"></script>'
      return js
    else
      js = javascript_include_tag('jquery.min')
    end
    js += javascript_include_tag('rails', 'application')
    js += javascript_include_tag('jquery_ujs','jquery.jsocial')
    return js
  end

end
