require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should belong_to :survey
  should allow_value("Presidential Debate").for(:name)

  end
