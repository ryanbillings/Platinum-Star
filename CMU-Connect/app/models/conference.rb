class Conference < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :public, :sessionId, :name, :description, :host_id
  has_event_calendar :start_at_field => 'start_time', :end_at_field => 'end_time'
  has_many :user_confs
  has_many :users, :through => :user_confs
end
