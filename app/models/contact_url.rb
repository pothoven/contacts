# == Schema Information
# Schema version: 20110825143843
#
# Table name: contact_urls
#
#  id         :integer         not null, primary key
#  contact_id :integer
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ContactUrl < ActiveRecord::Base
  belongs_to :contact

  attr_accessor :should_destroy

  validates_presence_of :contact

  def url_type
    host = URI.parse(self.url).host
    if host.present?
      host = host[4,host.size] if host[0,4] == 'www.'
      type = UrlType.find_by_base_url(host)
    end
    type = UrlType.find_by_name('other') if type.blank?
    return type
  end
end
