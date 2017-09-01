require 'test_helper'

class Answers::CheckControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get answers_check_create_url
    assert_response :success
  end

end
