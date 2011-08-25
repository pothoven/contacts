class StateProvince < ActiveRecord::Base
  belongs_to :country

  def StateProvince.for_select
    state_provinces = StateProvince.all.collect{|s| [s.name, s.id] }
    return state_provinces
  end
end
