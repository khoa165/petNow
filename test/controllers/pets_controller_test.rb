require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pets_index_url
    assert_response :success
  end

  test "should get new" do
    get pets_new_url
    assert_response :success
  end

  test "should get create" do
    get pets_create_url
    assert_response :success
  end

end
