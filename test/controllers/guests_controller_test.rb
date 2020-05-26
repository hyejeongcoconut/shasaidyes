require 'test_helper'

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get controller" do
    get guests_controller_url
    assert_response :success
  end

end
