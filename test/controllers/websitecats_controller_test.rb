require 'test_helper'

class WebsitecatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get websitecats_index_url
    assert_response :success
  end

end
