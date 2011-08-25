module ApplicationHelper

  def google_javascript_include_tag
    if ENV['RAILS_ENV'] == 'production'
      js += '<script src="' + request.protocol + 'ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2" type="text/javascript"></script>'
      js += javascript_include_tag('application','jquery.jsocial')
      js += '<script type="text/javascript">jQuery.noConflict();</script>'
      return js
    else
      js = javascript_include_tag('jquery-1.4.2.min')
      js += javascript_include_tag('application','jquery.jsocial')
      return js
    end
  end

end
