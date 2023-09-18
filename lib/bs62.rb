# frozen_string_literal: true

require_relative "bs62/extension"

require "bs62/version"

if ENV.fetch("DEBUG", false)
  require "debug"
  begin
    require "amazing_print"
  rescue LoadError # rubocop:disable Lint/SuppressedException
  end
end

class Bs62
  class << self
    def encode(bytes)
      raise TypeError, "argument must be an array of bytes; got a #{bytes.class}!" unless bytes.is_a?(Array)

      Bs62.perform_encode(bytes)
    end

    def decode(str)
      raise TypeError, "argument must be a String; got a #{str.class}!" unless str.is_a?(String)

      Bs62.perform_decode(str)
    end
  end
end
