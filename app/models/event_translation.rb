class EventTranslation < ActiveRecord::Base
  belongs_to :localedb
  belongs_to :event
end
