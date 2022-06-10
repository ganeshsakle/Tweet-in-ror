require "test_helper"

class SignUpControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sign_up_new_url
    assert_response :success
  end
end
