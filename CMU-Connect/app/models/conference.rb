class Conference < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :public, :sessionId, :name, :description, :host_id
  #has_event_calendar
end
