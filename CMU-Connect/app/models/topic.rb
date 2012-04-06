class Topic < ActiveRecord::Base
  attr_accessible :count, :name, :survey_id
  belongs_to :survey
end
