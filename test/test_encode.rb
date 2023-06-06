# frozen_string_literal: true

require "test_helper"

class TestEncode < Minitest::Test
  def test_that_it_encodes
    bytes = [
      91,
      140,
      113,
      21,
      254,
      218,
      185,
      239,
      123,
      227,
      249,
      108,
      124,
      124,
      220,
      13,
      53,
      128,
      214,
      66,
      175,
      232,
      1,
      11,
      100,
      170,
      211,
    ]

    assert_equal("RMradwMsTQeGW7DZTqcwBocNcwlb1EtMVnxF4", Bs62.encode(bytes))
  end
end
