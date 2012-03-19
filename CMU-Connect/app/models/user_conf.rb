class UserConf < ActiveRecord::Base
  attr_accessible :user_id, :conference_id, :andrew

  belongs_to :user
  belongs_to :conference
end
