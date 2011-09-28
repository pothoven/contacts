# == Schema Information
# Schema version: 20110825143843
#
# Table name: state_provinces
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  abbrev     :string(2)
#  country_id :integer
#

class StateProvince < ActiveRecord::Base
  belongs_to :country

  def StateProvince.for_select
    state_provinces = StateProvince.all.collect{|s| [s.name, s.id] }
    return state_provinces
  end
end
