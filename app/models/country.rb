class Country < ActiveRecord::Base
  has_many :programs
  has_many :courses

  has_many :maps, :as => :photoable

  has_many :translations, :class_name => 'CountryTranslation', :dependent => :destroy
  translate_columns :name,:description

  validates_presence_of :name

  include SetPermalink
  
end
