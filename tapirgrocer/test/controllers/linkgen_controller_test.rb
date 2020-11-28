require 'test_helper'

class LinkgenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get linkgen_index_url
    assert_response :success
  end

end
