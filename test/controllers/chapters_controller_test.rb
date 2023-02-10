require "test_helper"

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  test "should get prologue" do
    get chapters_prologue_url
    assert_response :success
  end
end
