require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get admin_dashboard" do
    get admin_admin_dashboard_url
    assert_response :success
  end

end
