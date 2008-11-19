class Admin::EventsController < ApplicationController

 before_filter :admin_required, :only => [:index,:new,:create,:edit,:update]


  def index
    @events=Event.find(:all, :order => :permalink)
  end

  def new
    @event=Event.new
  end

  def create
    @event=Event.new(params[:event])

    @event.build_event_photo(params[:event_photo])  unless params[:event_photo].nil?

    if  @event.save!
      flash[:notice]="Новость создана."
      redirect_to admin_l_events_path(@lang.to_s.split('-').first)
    else
      render :action => "new"
    end
  end

  def edit
    @event=Event.find(params[:id])
  end

  def update
    @event=Event.find(params[:id])

    unless params[:event_photo].nil?
      if @photo = @event.event_photo
        @photo.update_attributes(params[:event_photo])
      else
        @event.create_event_photo(params[:event_photo])
      end
    end

    if  @event.update_attributes(params[:event])
      expire_fragment(:fragment => 'event1')# if params[:id].to_i==1
      flash[:notice]="Новость обновлена"
      redirect_to admin_l_events_path(@lang.to_s.split('-').first)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to(admin_events_url) }
      format.xml  { head :ok }
    end
  end


end
