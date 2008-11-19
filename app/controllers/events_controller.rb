class EventsController < ApplicationController
  def show
    @event = Event.find_by_permalink(params[:id]) || Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end
end
