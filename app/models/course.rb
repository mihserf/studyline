class Course < ActiveRecord::Base
  belongs_to :country
  has_many :course_programs
  has_many :programs, :through => :course_programs
  has_many :opinions
  has_many :sub_courses, :class_name => "Course"
  belongs_to :parent_course, :class_name => "Course", :foreign_key=>"course_id"
  
  has_many :translations, :class_name => 'CourseTranslation', :dependent => :destroy
  translate_columns :name,:description

  validates_presence_of :name
  
  include SetPermalink
  
  def has_opinions?
    !opinions.empty?
  end

  def has_sub_courses?
    !sub_courses.empty?
  end

  def sub_course?
    course_id!=nil
  end

  acts_as_seo

end
