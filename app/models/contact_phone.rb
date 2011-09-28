# == Schema Information
# Schema version: 20110825143843
#
# Table name: contact_phones
#
#  id              :integer         not null, primary key
#  contact_id      :integer
#  phone_number    :string(255)
#  contact_type_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class ContactPhone < ActiveRecord::Base
  belongs_to :contact
  belongs_to :contact_type

  attr_accessor :should_destroy
end
