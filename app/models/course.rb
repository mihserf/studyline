class Course < ActiveRecord::Base
  belongs_to :country
  has_many :course_programs
  has_many :programs, :through => :course_programs
  
  
  has_many :translations, :class_name => 'CourseTranslation', :dependent => :destroy
  translate_columns :name,:description

  validates_presence_of :name
  
  include SetPermalink

end
