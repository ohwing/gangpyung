require 'test_helper'

class LcommentsControllerTest < ActionController::TestCase
  test "should get lcomment" do
    get :lcomment
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
