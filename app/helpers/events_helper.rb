module EventsHelper
  def events_list
   events = Event.find(:all, :limit => 4, :order => "created_at DESC")
   render  :partial => "events/events_list", :locals => {:events => events}
  end
end
