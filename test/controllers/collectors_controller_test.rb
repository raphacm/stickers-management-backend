require 'test_helper'

class CollectorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collector = collectors(:one)
  end

  test "should get index" do
    get collectors_url, as: :json
    assert_response :success
  end

  test "should create collector" do
    assert_difference('Collector.count') do
      post collectors_url, params: { collector: { email: @collector.email, name: @collector.name, uuid: @collector.uuid } }, as: :json
    end

    assert_response 201
  end

  test "should show collector" do
    get collector_url(@collector), as: :json
    assert_response :success
  end

  test "should update collector" do
    patch collector_url(@collector), params: { collector: { email: @collector.email, name: @collector.name, uuid: @collector.uuid } }, as: :json
    assert_response 200
  end

  test "should destroy collector" do
    assert_difference('Collector.count', -1) do
      delete collector_url(@collector), as: :json
    end

    assert_response 204
  end
end
