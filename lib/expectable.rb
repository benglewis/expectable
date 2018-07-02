require 'minitest'
require 'minitest/mock'

module Expectable
  def expect(method_name, return_value = nil, expected_args = nil)
    mock = generate_mock(return_value, expected_args)

    stub(method_name, mock) do
      yield
    end

    begin
      mock.verify
    rescue MockExpectationError
      raise ExpectationError, "Expected method #{method_name} to be called on object " \
                              "<#{self.class} ##{object_id}>"
    end
  end

  private

  def generate_mock(return_value = nil, expected_args = nil)
    mock = Minitest::Mock.new

    # Expected arguments can either be an array or a Proc
    if expected_args&.is_a?(Array)
      mock.expect :call, return_value, expected_args
    elsif expected_args.class == Proc # Note: In Ruby lambdas have class Proc
      mock.expect :call, return_value, &expected_args
    else
      # Allows us to run expect without caring about which args are given
      # I know that this isn't Minitest behaviour, but it's prettier
      mock.expect :call, return_value do
        true
      end
    end

    mock
  end

  class ExpectationError < StandardError
  end
end