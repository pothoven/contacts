# == Schema Information
# Schema version: 20110825143843
#
# Table name: countries
#
#  id     :integer         not null, primary key
#  name   :string(255)
#  abbrev :string(2)
#

class Country < ActiveRecord::Base
end
