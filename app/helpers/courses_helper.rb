module CoursesHelper
  def courses(program)
    render  :partial => "courses/courses_block", :locals =>{:program => program}
  end
end
