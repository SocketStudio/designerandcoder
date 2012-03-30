require 'test_helper'

class DesignerProfilesControllerTest < ActionController::TestCase
  setup do
    @designer_profile = designer_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:designer_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create designer_profile" do
    assert_difference('DesignerProfile.count') do
      post :create, designer_profile: @designer_profile.attributes
    end

    assert_redirected_to designer_profile_path(assigns(:designer_profile))
  end

  test "should show designer_profile" do
    get :show, id: @designer_profile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @designer_profile.to_param
    assert_response :success
  end

  test "should update designer_profile" do
    put :update, id: @designer_profile.to_param, designer_profile: @designer_profile.attributes
    assert_redirected_to designer_profile_path(assigns(:designer_profile))
  end

  test "should destroy designer_profile" do
    assert_difference('DesignerProfile.count', -1) do
      delete :destroy, id: @designer_profile.to_param
    end

    assert_redirected_to designer_profiles_path
  end
end
