class Page < ActiveRecord::Base
  has_many :translations, :class_name => 'PageTranslation', :dependent => :destroy
  translate_columns :name,:content

  acts_as_seo
  
end
