class ContactPhone < ActiveRecord::Base
  belongs_to :contact
  belongs_to :contact_type

  attr_accessor :should_destroy
end
