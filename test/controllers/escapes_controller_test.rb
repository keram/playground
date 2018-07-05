require 'test_helper'

class EscapesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escape = escapes(:one)
  end

  test "should get index" do
    get escapes_url
    assert_response :success
  end

  test "should get new" do
    get new_escape_url
    assert_response :success
  end

  test "should create escape" do
    assert_difference('Escape.count') do
      post escapes_url, params: { escape: { payload: @escape.payload } }
    end

    assert_redirected_to escape_url(Escape.last)
  end

  test "should get edit" do
    get edit_escape_url(@escape)
    assert_response :success
  end

  test "should update escape" do
    patch escape_url(@escape), params: { escape: { organiser: @escape.organiser } }
    assert_redirected_to escape_url(@escape)
  end
end
