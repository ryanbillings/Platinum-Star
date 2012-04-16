require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Survey.new.valid?
  end
  
 
  
  should have_many :topics
  should have_many :survey_users
  should have_many (:users).through(:survey_users)
  
  should allow_value("Presidential Debate").for(:topic)
  
  
end
