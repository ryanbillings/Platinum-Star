class Survey < ActiveRecord::Base
  attr_accessible :start_date, :end_date, :topics_attributes
  has_many :topics, :dependent => :destroy
  has_many :survey_users, :dependent => :destroy
  has_many :users, :through => :survey_users

  accepts_nested_attributes_for :topics
end
