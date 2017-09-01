require 'test_helper'

class Answers::CorrectsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get answers_corrects_show_url
    assert_response :success
  end

end
