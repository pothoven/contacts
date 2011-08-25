class UrlType < ActiveRecord::Base
  acts_as_enumerated
  has_many :contact_urls

  SITE_NAMES = UrlType.find(:all, :conditions => 'base_url is not null').collect {|url| url.base_url }

  def UrlType.for(object)
    url_types = UrlType.all.collect{|u| [u.display_name, u.id] }
    case object.class.name
    when "ContactUrl"
      url_types.delete_if { |key, value| key.downcase.eql?("twitter") }
    end
    return url_types
  end

end
