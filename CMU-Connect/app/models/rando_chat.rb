class RandoChat < ActiveRecord::Base
  attr_accessible :u1_id, :u2_id, :sessionId, :social, :status
  has_one :exchange
end
