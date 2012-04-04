class Conference < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :public, :sessionId, :name, :description, :host_id, :professional,:user_confs_attributes
  has_event_calendar :start_at_field => 'start_time', :end_at_field => 'end_time', :name_field => 'name'
  has_many :user_confs, :dependent => :destroy
  has_many :users, :through => :user_confs
  
  
  validates_presence_of :start_time, :end_time, :name 

  accepts_nested_attributes_for :user_confs,
  :reject_if => lambda { |a| User.find_by_andrew(a['andrew']) == nil }, :allow_destroy => true
 
end
