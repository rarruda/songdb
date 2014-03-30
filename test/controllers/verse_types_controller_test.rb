require 'test_helper'

class VerseTypesControllerTest < ActionController::TestCase
  setup do
    @verse_type = verse_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:verse_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create verse_type" do
    assert_difference('VerseType.count') do
      post :create, verse_type: { name: @verse_type.name, order: @verse_type.order, shortcut_key: @verse_type.shortcut_key }
    end

    assert_redirected_to verse_type_path(assigns(:verse_type))
  end

  test "should show verse_type" do
    get :show, id: @verse_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @verse_type
    assert_response :success
  end

  test "should update verse_type" do
    patch :update, id: @verse_type, verse_type: { name: @verse_type.name, order: @verse_type.order, shortcut_key: @verse_type.shortcut_key }
    assert_redirected_to verse_type_path(assigns(:verse_type))
  end

  test "should destroy verse_type" do
    assert_difference('VerseType.count', -1) do
      delete :destroy, id: @verse_type
    end

    assert_redirected_to verse_types_path
  end
end
