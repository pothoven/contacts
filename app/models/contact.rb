# == Schema Information
# Schema version: 20110825143843
#
# Table name: contacts
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  birthday   :date
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  has_many :addresses, :class_name => 'ContactAddress', :dependent => :destroy
  has_one :company, :class_name => 'ContactCompanyDetail', :dependent => :destroy
  has_many :emails, :class_name => 'ContactEmail', :dependent => :destroy
  has_many :phones, :class_name => 'ContactPhone', :dependent => :destroy
  has_many :urls, :class_name => 'ContactUrl', :dependent => :destroy

  validates_associated :phones, :addresses, :emails, :urls, :company

  def company=(company_attributes)
    if company.present?
      company.update_attributes(company_attributes)
    else
      company = ContactCompanyDetail.new(company_attributes)
      company.contact = self
      company.save(:validate => false)
    end
  end

  # refer to http://refactormycode.com/codes/87-combine-contact-attributes-in-model to refactor the following methods

  def phones=(phone_attributes)
    phone_attributes.each do |id, attributes|
      if id.to_i == 0
        next;
      elsif id.to_i <= 0
        phones.build(attributes) unless attributes[:phone_number].blank?
      else
        phone = phones.detect { |p| p.id == id.to_i }
        phone.attributes = attributes
      end
    end
    phones.reject{ |p| p.new_record? || phone_attributes.has_key?(p.id.to_s) }.each { |p| p.should_destroy = true }
  end

  def emails=(email_attributes)
    email_attributes.each do |id, attributes|
      if id.to_i == 0
        next;
      elsif id.to_i <= 0
        emails.build(attributes) unless attributes[:email].blank?
      else
        email = emails.detect { |e| e.id == id.to_i }
        email.attributes = attributes
      end
    end
    emails.reject{ |e| e.new_record? || email_attributes.has_key?(e.id.to_s) }.each { |e| e.should_destroy = true }
  end

  def addresses=(address_attributes)
    address_attributes.each do |id, attributes|
      if id.to_i == 0
        next;
      elsif id.to_i <= 0
        addresses.build(attributes)
      else
        address = addresses.detect { |a| a.id == id.to_i }
        address.attributes = attributes
      end
    end
    addresses.reject{ |a| a.new_record? || address_attributes.has_key?(a.id.to_s) }.each { |a| a.should_destroy = true }
  end

  def urls=(url_attributes)
    url_attributes.each do |id, attributes|
      if id.to_i == 0
        next;
      elsif id.to_i <= 0
        urls.build(attributes) unless attributes[:url].blank?
      else
        url = urls.detect { |u| u.id == id.to_i }
        url.attributes = attributes
        # remove blank urls
        if url.url.blank?
          url.should_destroy = true
        end
      end
    end
    urls.reject{ |u| u.new_record? || url_attributes.has_key?(u.id.to_s) }.each { |u| u.should_destroy = true }
  end

  def save_contact_info
    phones.each do |p|
      if p.should_destroy
        p.destroy
      else
        p.save(:validate => false)
      end
    end
    emails.each do |e|
      if e.should_destroy
        e.destroy
      else
        e.save(:validate => false)
      end
    end
    addresses.each do |a|
      if a.should_destroy
        a.destroy
      else
        a.save(:validate => false)
      end
    end
    urls.each do |u|
      if u.should_destroy
        u.destroy
      else
        u.save(:validate => false)
      end
    end
  end

  def vcard
    card = Vpim::Vcard::Maker.make2 do |maker|

      maker.nickname = self.name

      maker.birthday = self.birthday if self.birthday.present?
      maker.org = self.company.organization if self.company.present? && self.company.organization.present?
      maker.title = self.company.title if self.company.present? && self.company.title.present?

      maker.add_name do |name|
        name.given = self.name
      end

      addresses = self.addresses
      if addresses.present?
        addresses.each do |contact|
          maker.add_addr do |addr|
            addr.location = contact.contact_type.present? ? contact.contact_type.name : 'other'
            addr.street = contact.address_1 if contact.address_1.present?
            addr.street += ", " + contact.address_2 if contact.address_2.present?
            addr.locality = contact.city if contact.city.present?
            addr.region = contact.state_province.name if contact.state_province.present?
            addr.postalcode = contact.postal if contact.postal.present?
            addr.country = contact.country.name if contact.country.present?
          end
        end
      end

      phones = self.phones
      if phones.present?
        phones.each do |phone|
          maker.add_tel(phone.phone_number) do |tel|
            tel.location = phone.contact_type.name
            #tel.preferred = true
          end
        end
      end

      emails = self.emails
      if emails.present?
        emails.each do |email|
          maker.add_email(email.email) do |e|
            e.location = email.contact_type.name
          end
        end
      end

      # add urls
      urls = self.urls
      if urls.present?
        urls.each do |url|
          maker.add_url(url.url)
        end
      end
    end
    return card
  end

end
