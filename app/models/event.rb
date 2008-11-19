class Event < ActiveRecord::Base
  has_one :event_photo

  has_many :translations, :class_name => 'EventTranslation', :dependent => :destroy
  translate_columns :name, :description, :short_description

  include SetPermalink
  
end
