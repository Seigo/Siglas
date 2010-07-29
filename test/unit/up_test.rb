require 'test_helper'

class UpTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Up.new.valid?
  end
end
