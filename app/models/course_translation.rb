class CourseTranslation < ActiveRecord::Base
  belongs_to :localedb
  belongs_to :course
end
