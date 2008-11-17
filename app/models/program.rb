class Program < ActiveRecord::Base
  has_many :country_programs
  has_many :countries, :through => :country_programs
  
  has_many :course_programs
  has_many :courses, :through => :course_programs

  has_many :translations, :class_name => 'ProgramTranslation', :dependent => :destroy
  translate_columns :name,:description

  belongs_to :country

  validates_presence_of :name

  acts_as_nested_set

  include SetPermalink

  #named_scope :roots, :conditions => {:parent_id=>nil}

  

end
