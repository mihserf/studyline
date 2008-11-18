module CoursesHelper
  def courses(program)
    #courses = program.courses
    render  :partial => "courses/courses_block", :locals =>{:program => program}
  end
end
