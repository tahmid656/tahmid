require 'test_helper'

class SignUpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sign_up = sign_ups(:one)
  end

  test "should get index" do
    get sign_ups_url
    assert_response :success
  end

  test "should get new" do
    get new_sign_up_url
    assert_response :success
  end

  test "should create sign_up" do
    assert_difference('SignUp.count') do
      post sign_ups_url, params: { sign_up: { fullname: @sign_up.fullname, store_location: @sign_up.store_location } }
    end

    assert_redirected_to sign_up_url(SignUp.last)
  end

  test "should show sign_up" do
    get sign_up_url(@sign_up)
    assert_response :success
  end

  test "should get edit" do
    get edit_sign_up_url(@sign_up)
    assert_response :success
  end

  test "should update sign_up" do
    patch sign_up_url(@sign_up), params: { sign_up: { fullname: @sign_up.fullname, store_location: @sign_up.store_location } }
    assert_redirected_to sign_up_url(@sign_up)
  end

  test "should destroy sign_up" do
    assert_difference('SignUp.count', -1) do
      delete sign_up_url(@sign_up)
    end

    assert_redirected_to sign_ups_url
  end
end
