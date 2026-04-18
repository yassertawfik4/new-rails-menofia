require "test_helper"

class PostEditorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_editor = post_editors(:one)
  end

  test "should get index" do
    get post_editors_url
    assert_response :success
  end

  test "should get new" do
    get new_post_editor_url
    assert_response :success
  end

  test "should create post_editor" do
    assert_difference("PostEditor.count") do
      post post_editors_url, params: { post_editor: { editor_id: @post_editor.editor_id, post_id: @post_editor.post_id } }
    end

    assert_redirected_to post_editor_url(PostEditor.last)
  end

  test "should show post_editor" do
    get post_editor_url(@post_editor)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_editor_url(@post_editor)
    assert_response :success
  end

  test "should update post_editor" do
    patch post_editor_url(@post_editor), params: { post_editor: { editor_id: @post_editor.editor_id, post_id: @post_editor.post_id } }
    assert_redirected_to post_editor_url(@post_editor)
  end

  test "should destroy post_editor" do
    assert_difference("PostEditor.count", -1) do
      delete post_editor_url(@post_editor)
    end

    assert_redirected_to post_editors_url
  end
end
