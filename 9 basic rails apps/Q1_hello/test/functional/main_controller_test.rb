require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get goodbye" do
    get :goodbye
    assert_response :success
  end

end
