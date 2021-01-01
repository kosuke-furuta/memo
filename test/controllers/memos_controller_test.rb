require 'test_helper'

class TaskMemosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get task_memos_index_url
    assert_response :success
  end

  test "should get show" do
    get task_memos_show_url
    assert_response :success
  end

  test "should get new" do
    get task_memos_new_url
    assert_response :success
  end

  test "should get edit" do
    get task_memos_edit_url
    assert_response :success
  end

end
