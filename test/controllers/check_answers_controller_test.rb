require 'test_helper'

class CheckAnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get check_answers_create_url
    assert_response :success
  end

end
