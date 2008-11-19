class ProgramsController < ApplicationController
  def index
  end

  def show
    @program = Program.find_by_permalink(params[:id]) || Program.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @program }
    end
  end

end
