class OpinionsController < ApplicationController
  def show
    @opinion = Opinion.find_by_permalink(params[:id]) || Opinion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opinion }
    end
  end

  def index
    @opinions = Opinion.find(:all, :order => "created_at DESC" )

    respond_to  do |format|
      format.html # show index.html.erb
      format.xml {render :xml => @opinions}
    end
  end

end
