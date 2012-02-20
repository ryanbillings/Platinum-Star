class Conference < ActiveRecord::Base
  attr_accessible :date, :public, :sessionId, :name, :description, :host_id
end
