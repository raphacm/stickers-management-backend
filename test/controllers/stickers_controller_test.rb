require 'test_helper'

class StickersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sticker = stickers(:one)
  end

  test "should get index" do
    get stickers_url, as: :json
    assert_response :success
  end

  test "should create sticker" do
    assert_difference('Sticker.count') do
      post stickers_url, params: { sticker: { collection_id: @sticker.collection_id, number: @sticker.number, quantity: @sticker.quantity, uuid: @sticker.uuid } }, as: :json
    end

    assert_response 201
  end

  test "should show sticker" do
    get sticker_url(@sticker), as: :json
    assert_response :success
  end

  test "should update sticker" do
    patch sticker_url(@sticker), params: { sticker: { collection_id: @sticker.collection_id, number: @sticker.number, quantity: @sticker.quantity, uuid: @sticker.uuid } }, as: :json
    assert_response 200
  end

  test "should destroy sticker" do
    assert_difference('Sticker.count', -1) do
      delete sticker_url(@sticker), as: :json
    end

    assert_response 204
  end
end
