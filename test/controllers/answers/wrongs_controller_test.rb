require 'test_helper'

class Answers::WrongsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get answers_wrongs_show_url
    assert_response :success
  end

end
