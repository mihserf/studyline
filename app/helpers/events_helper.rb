module EventsHelper
  def events_list
   render  :partial => "event_list", :locals => {:events => events}
  end
end
