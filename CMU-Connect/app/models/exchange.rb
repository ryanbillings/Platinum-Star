class Exchange < ActiveRecord::Base
  attr_accessible :rando_chat_id, :match
  belongs_to :rando_chat
end
