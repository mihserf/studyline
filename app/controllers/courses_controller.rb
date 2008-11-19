class CoursesController < ApplicationController
  before_filter :get_program
  def show
    @course = Course.find_by_permalink(params[:id]) || Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course }
    end
  end

  def get_program
    @program = Program.find_by_permalink(params[:program_id]) || Program.find(params[:program_id]) if params[:program_id]
  end
end
