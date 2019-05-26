require 'test_helper'

class RhetoricsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rhetorics_index_url
    assert_response :success
  end

  test "should get new" do
    get rhetorics_new_url
    assert_response :success
  end

  test "should get edit" do
    get rhetorics_edit_url
    assert_response :success
  end

end
