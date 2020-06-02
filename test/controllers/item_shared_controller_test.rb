require 'test_helper'

class ItemSharedControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get item_shared_new_url
    assert_response :success
  end

end
