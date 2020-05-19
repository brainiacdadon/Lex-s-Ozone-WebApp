require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get nyumbani" do
    get home_nyumbani_url
    assert_response :success
  end

end
