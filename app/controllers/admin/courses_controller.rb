class Admin::CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course=Course.new
  end

  def create
    @course=Course.new(params[:course])
    if  @course.save!
      flash[:notice]="Курс создан."
      redirect_to admin_l_courses_path(@lang.to_s.split('-').first)
    else
      render :action => "new"
    end
  end

  def edit
    @course=Course.find(params[:id])
  end

  def update
    @course=Course.find(params[:id])

   
    if  @course.update_attributes(params[:course])
      flash[:notice]="курс обновлен"
      redirect_to admin_l_courses_path(@lang.to_s.split('-').first)
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    respond_to do |format|
      format.html { redirect_to(admin_courses_url) }
      format.xml  { head :ok }
    end
  end


end
