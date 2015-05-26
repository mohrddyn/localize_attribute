class Country < ActiveRecord::Base
  localize_attribute :name, %i[en fi sv], synchronize: true
end
