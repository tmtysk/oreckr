require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  setup do
    @setting = settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create setting" do
    assert_difference('Setting.count') do
      post :create, setting: { access_key_id: @setting.access_key_id, s3_bucket_name: @setting.s3_bucket_name, secret_access_key: @setting.secret_access_key }
    end

    assert_redirected_to setting_path(assigns(:setting))
  end

  test "should show setting" do
    get :show, id: @setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @setting
    assert_response :success
  end

  test "should update setting" do
    put :update, id: @setting, setting: { access_key_id: @setting.access_key_id, s3_bucket_name: @setting.s3_bucket_name, secret_access_key: @setting.secret_access_key }
    assert_redirected_to setting_path(assigns(:setting))
  end

  test "should destroy setting" do
    assert_difference('Setting.count', -1) do
      delete :destroy, id: @setting
    end

    assert_redirected_to settings_path
  end
end
