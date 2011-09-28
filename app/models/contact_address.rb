# == Schema Information
# Schema version: 20110825143843
#
# Table name: contact_addresses
#
#  id                :integer         not null, primary key
#  contact_id        :integer
#  address_1         :string(255)
#  address_2         :string(255)
#  city              :string(255)
#  postal            :string(255)
#  state_province_id :integer
#  country_id        :integer
#  contact_type_id   :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class ContactAddress < ActiveRecord::Base
  belongs_to :contact
  belongs_to :contact_type
  belongs_to :country
  belongs_to :state_province

  attr_accessor :should_destroy

  def one_line
    line = ""
    line += self.address_1 if self.address_1.present?
    line += "<br/>" if address_1.present?
    line += self.address_2 if self.address_2.present?
    line += "<br/>" if address_2.present?
    line += self.city if self.city.present?
    line += ", " if city.present? && self.state_province.present?
    line += self.state_province.abbrev if self.state_province.present?
    line += " "
    line += self.country.abbrev if self.country.present?
    line += " "
    line += self.postal if self.postal.present?
    return line
  end
end
