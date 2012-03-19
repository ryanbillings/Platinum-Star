class UserConf < ActiveRecord::Base
  attr_accessible :user_id, :conference_id

  belongs_to :user
  belongs_to :conference
end
