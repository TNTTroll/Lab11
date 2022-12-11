# frozen_string_literal: true

require 'test_helper'

Empty_result_data = [
  { n: '0', a: '1 1 2 2 3' },
  { n: '10', a: '' },
  { a: '1 1 2 2 3' },
  { n: '5' },
  {}
].freeze

Testing_data = [
  {
    input: { n: '5', a: '1 1 2 2 3' },
    output: [[1, 1], [1]]
  },
  {
    input: { n: '8', a: '0 0 1 5 5 0 625' },
    output: [[1, 5, 5], [5, 5], [1, 5], [625], [5], [1]]
  }
].freeze

class NumberControllerTest < ActionDispatch::IntegrationTest
  '''
  test "should get input" do
    get "/number/input"
    assert_response :success
  end

  test "should get view" do
    get "/number/view"
    assert_response :success
  end
  '''

  test "should return 11.00 result" do
    get "/number/view", params: { a: "121" }
    assert_in_delta assigns[:result], 11.00, 10**-2
  end
end
