class CountryTranslation < ActiveRecord::Base
  belongs_to :localedb
  belongs_to :country
end
