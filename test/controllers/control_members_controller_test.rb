require 'test_helper'

class ControlMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get control_members_index_url
    assert_response :success
  end

end
