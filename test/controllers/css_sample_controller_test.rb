require 'test_helper'

class CssSampleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get css_sample_index_url
    assert_response :success
  end

  test "should get home" do
    get css_sample_home_url
    assert_response :success
  end

end
