require 'test_helper'

class ConferenceTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Conference.new.valid?
  end
end
