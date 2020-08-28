require 'test_helper'

class NearestStation　sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nearest_station　 = nearest_station　s(:one)
  end

  test "should get index" do
    get nearest_station　s_url
    assert_response :success
  end

  test "should get new" do
    get new_nearest_station　_url
    assert_response :success
  end

  test "should create nearest_station　" do
    assert_difference('NearestStation　.count') do
      post nearest_station　s_url, params: { nearest_station　: {  } }
    end

    assert_redirected_to nearest_station　_url(NearestStation　.last)
  end

  test "should show nearest_station　" do
    get nearest_station　_url(@nearest_station　)
    assert_response :success
  end

  test "should get edit" do
    get edit_nearest_station　_url(@nearest_station　)
    assert_response :success
  end

  test "should update nearest_station　" do
    patch nearest_station　_url(@nearest_station　), params: { nearest_station　: {  } }
    assert_redirected_to nearest_station　_url(@nearest_station　)
  end

  test "should destroy nearest_station　" do
    assert_difference('NearestStation　.count', -1) do
      delete nearest_station　_url(@nearest_station　)
    end

    assert_redirected_to nearest_station　s_url
  end
end
