# == Schema Information
# Schema version: 20110825143843
#
# Table name: contact_company_details
#
#  id           :integer         not null, primary key
#  contact_id   :integer
#  title        :string(32)
#  organization :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class ContactCompanyDetail < ActiveRecord::Base
  belongs_to :contact
end
