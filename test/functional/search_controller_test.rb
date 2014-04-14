require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get byid" do
    get :byid
    assert_response :success
  end

  test "should get byname" do
    get :byname
    assert_response :success
  end

  test "should get byidresult" do
    get :byidresult
    assert_response :success
  end

  test "should get bynameresult" do
    get :bynameresult
    assert_response :success
  end

end
