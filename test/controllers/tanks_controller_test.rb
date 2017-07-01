require 'test_helper'

class TanksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tanks_index_url
    assert_response :success
  end

  test "should get show" do
    get tanks_show_url
    assert_response :success
  end

  test "should get new" do
    get tanks_new_url
    assert_response :success
  end

  test "should get create" do
    get tanks_create_url
    assert_response :success
  end

  test "should get edit" do
    get tanks_edit_url
    assert_response :success
  end

  test "should get update" do
    get tanks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get tanks_destroy_url
    assert_response :success
  end

end
