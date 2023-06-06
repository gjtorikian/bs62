# frozen_string_literal: true

require "test_helper"

class TestMaliciousness < Minitest::Test
  def test_that_encode_needs_an_array
    arr = "<b>Wow!</b>"
    assert_raises(TypeError) do
      Bs62.encode(arr)
    end
  end

  def test_that_decode_needs_a_string
    str = 123
    assert_raises(TypeError) do
      Bs62.decode(str)
    end
  end

  def test_that_decode_expects_base62_characters
    str = "%^&*()_+"
    assert_raises(RuntimeError) do
      Bs62.decode(str)
    end
  end
end
