require 'test_helper'

class ConferenceTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Conference.new.valid?
  end
  

  should have_many :user_confs
  should have_many(:users).through(:user_confs)
  
  
end
