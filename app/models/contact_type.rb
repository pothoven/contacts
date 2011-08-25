class ContactType < ActiveRecord::Base
  acts_as_enumerated

  def ContactType.for(object)
    contact_types = ContactType.all.collect{|c| [c.name, c.id] }
    case object.class.name
    when "ContactEmail",
         "ContactAddress"
      contact_types.delete_if { |key, value| key.downcase.eql?("fax") }
      contact_types.delete_if { |key, value| key.downcase.eql?("mobile") }
    end
    return contact_types
  end

end
