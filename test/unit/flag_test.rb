require 'test_helper'

class FlagTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Flag.new.valid?
  end
end
