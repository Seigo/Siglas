require 'test_helper'

class SiglaTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Sigla.new.valid?
  end
end
