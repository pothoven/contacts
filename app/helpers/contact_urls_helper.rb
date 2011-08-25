module ContactUrlsHelper

  def build_jsocial_config(contact_urls)
    jsocial = "jQuery(document).ready(function() {
      jQuery('.social').jsocial({"

    contact_urls.each do |url|
      jsocial += "#{url.url_type.name}    :  '#{url.url}',";
    end
    jsocial += "small   : true,
            center      : true,
            inline      : true
      });
      });"
    return jsocial
  end

end
