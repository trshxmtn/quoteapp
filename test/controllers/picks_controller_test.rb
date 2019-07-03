require 'test_helper'

class PicksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get picks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get picks_destroy_url
    assert_response :success
  end

end
