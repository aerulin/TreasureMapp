require 'test_helper'

class ChallengesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get challenge_show_url
    assert_response :success
  end

  test "should get new" do
    get challenge_new_url
    assert_response :success
  end

  test "should get create" do
    get challenge_create_url
    assert_response :success
  end

end
