require 'test_helper'

class MyRsasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_rsa = my_rsas(:one)
  end

  test "should get index" do
    get my_rsas_url
    assert_response :success
  end

  test "should get new" do
    get new_my_rsa_url
    assert_response :success
  end

  test "should create my_rsa" do
    assert_difference('MyRsa.count') do
      post my_rsas_url, params: { my_rsa: { d: @my_rsa.d, e: @my_rsa.e, n: @my_rsa.n } }
    end

    assert_redirected_to my_rsa_url(MyRsa.last)
  end

  test "should show my_rsa" do
    get my_rsa_url(@my_rsa)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_rsa_url(@my_rsa)
    assert_response :success
  end

  test "should update my_rsa" do
    patch my_rsa_url(@my_rsa), params: { my_rsa: { d: @my_rsa.d, e: @my_rsa.e, n: @my_rsa.n } }
    assert_redirected_to my_rsa_url(@my_rsa)
  end

  test "should destroy my_rsa" do
    assert_difference('MyRsa.count', -1) do
      delete my_rsa_url(@my_rsa)
    end

    assert_redirected_to my_rsas_url
  end
end
