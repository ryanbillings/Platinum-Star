require 'test_helper'

class RandoChatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    should have_many :complaints
    should have_one :exchange
	
end
