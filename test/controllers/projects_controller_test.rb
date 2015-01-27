require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get zurb_sidebar" do
    get :zurb_sidebar
    assert_response :success
  end

  test "should get column_navigation" do
    get :column_navigation
    assert_response :success
  end

end
