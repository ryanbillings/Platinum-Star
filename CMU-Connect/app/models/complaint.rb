class Complaint < ActiveRecord::Base
  attr_accessible :to_user, :from_user, :description, :rando_chat_id
  belongs_to :rando_chat
end
