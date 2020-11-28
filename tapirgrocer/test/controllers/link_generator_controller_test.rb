require 'test_helper'

class LinkGeneratorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get link_generator_index_url
    assert_response :success
  end

end
