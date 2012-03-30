require 'test_helper'

class CoderProfilesControllerTest < ActionController::TestCase
  setup do
    @coder_profile = coder_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coder_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coder_profile" do
    assert_difference('CoderProfile.count') do
      post :create, coder_profile: @coder_profile.attributes
    end

    assert_redirected_to coder_profile_path(assigns(:coder_profile))
  end

  test "should show coder_profile" do
    get :show, id: @coder_profile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coder_profile.to_param
    assert_response :success
  end

  test "should update coder_profile" do
    put :update, id: @coder_profile.to_param, coder_profile: @coder_profile.attributes
    assert_redirected_to coder_profile_path(assigns(:coder_profile))
  end

  test "should destroy coder_profile" do
    assert_difference('CoderProfile.count', -1) do
      delete :destroy, id: @coder_profile.to_param
    end

    assert_redirected_to coder_profiles_path
  end
end
