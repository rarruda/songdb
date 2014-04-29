require 'test_helper'

class SongbooksControllerTest < ActionController::TestCase
  setup do
    @songbook = songbooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:songbooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create songbook" do
    assert_difference('Songbook.count') do
      post :create, songbook: { name: @songbook.name }
    end

    assert_redirected_to songbook_path(assigns(:songbook))
  end

  test "should show songbook" do
    get :show, id: @songbook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @songbook
    assert_response :success
  end

  test "should update songbook" do
    patch :update, id: @songbook, songbook: { name: @songbook.name }
    assert_redirected_to songbook_path(assigns(:songbook))
  end

  test "should destroy songbook" do
    assert_difference('Songbook.count', -1) do
      delete :destroy, id: @songbook
    end

    assert_redirected_to songbooks_path
  end
end
