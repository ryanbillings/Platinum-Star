require 'test_helper'

class ThemeChatTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ThemeChat.new.valid?
  end
end
