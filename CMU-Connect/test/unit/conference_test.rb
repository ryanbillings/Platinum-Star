require 'test_helper'

class ConferenceTest < ActiveSupport::TestCase
  
  

  should have_many :user_confs
  should have_many(:users)
  
  
end
