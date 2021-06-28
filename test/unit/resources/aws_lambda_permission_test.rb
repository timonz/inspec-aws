require 'helper'
require 'aws_lambda_permission'
require 'aws-sdk-core'

class AWSLambdaPermissionConstructorTest < Minitest::Test

  def test_empty_params_not_ok
    assert_raises(ArgumentError) { AWSLambdaPermission.new(client_args: { stub_responses: true }) }
  end

  def test_empty_param_arg_not_ok
    assert_raises(ArgumentError) { AWSLambdaPermission.new(function_name: 'test1', Sid: '', client_args: { stub_responses: true }) }
  end

  def test_rejects_unrecognized_params
    assert_raises(ArgumentError) { AWSLambdaPermission.new(unexpected: 9) }
  end
end

class AWSLambdaPermissionSuccessPathTest < Minitest::Test

  def setup
    data = {}
    data[:method] = :get_policy
    mock_data = {}
    mock_data[:sid] = 'test1'
    mock_data[:effect] = 'test1'
    mock_data[:principal] = 'test1'
    mock_data[:action] = 'test1'
    mock_data[:resource] = 'test1'
    data[:data] = mock_data
    data[:client] = Aws::Lambda::Client
    @resp = AWSLambdaPermission.new(function_name: 'test1', Sid: 'test1', client_args: { stub_responses: true }, stub_data: [data])
  end

  def test_sid
    assert_equal(@resp.sid, 'test1')
  end

  def test_effects
    assert_equal(@resp.effect, 'test1')
  end

  def test_principal
    assert_equal(@resp.principal, 'test1')
  end

  def test_action
    assert_equal(@resp.action, 'test1')
  end

  def test_resource
    assert_equal(@resp.resource, 'test1')
  end
end