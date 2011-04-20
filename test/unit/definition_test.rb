require 'test_helper'

class DefinitionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Definition.new.valid?
  end
end
