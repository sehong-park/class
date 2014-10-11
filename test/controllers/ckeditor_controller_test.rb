require 'test_helper'

class CkeditorControllerTest < ActionController::TestCase
  test "should get picktures" do
    get :picktures
    assert_response :success
  end

end
