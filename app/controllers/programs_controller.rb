class ProgramsController < ApplicationController
  def index
  end

  def show
    @program = Program.find_by_permalink(params[:id]) || Program.find(params[:id])
  end

end
