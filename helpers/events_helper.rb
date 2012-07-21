

module EventsHelper
  
  def event_path event
    "/events/go-to/#{event.to_param}"
  end
  
end