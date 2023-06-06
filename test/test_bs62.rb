# frozen_string_literal: true

require "test_helper"

class TestBs62 < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil(::Bs62::VERSION)
  end
end
