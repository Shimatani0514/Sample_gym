require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get service" do
    get static_pages_service_url
    assert_response :success
  end

  test "should get fee" do
    get static_pages_fee_url
    assert_response :success
  end

  test "should get staff" do
    get static_pages_staff_url
    assert_response :success
  end

  test "should get shop" do
    get static_pages_shop_url
    assert_response :success
  end

  test "should get Contact" do
    get static_pages_Contact_url
    assert_response :success
  end

  test "should get code" do
    get static_pages_code_url
    assert_response :success
  end
end
