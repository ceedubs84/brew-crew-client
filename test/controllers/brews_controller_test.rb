require 'test_helper'

class BrewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brews_index_url
    assert_response :success
  end

  test "should get show" do
    get brews_show_url
    assert_response :success
  end

end
