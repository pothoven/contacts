require 'test_helper'

class StateProvincesControllerTest < ActionController::TestCase
  setup do
    @state_province = state_provinces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:state_provinces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create state_province" do
    assert_difference('StateProvince.count') do
      post :create, :state_province => @state_province.attributes
    end

    assert_redirected_to state_province_path(assigns(:state_province))
  end

  test "should show state_province" do
    get :show, :id => @state_province.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @state_province.to_param
    assert_response :success
  end

  test "should update state_province" do
    put :update, :id => @state_province.to_param, :state_province => @state_province.attributes
    assert_redirected_to state_province_path(assigns(:state_province))
  end

  test "should destroy state_province" do
    assert_difference('StateProvince.count', -1) do
      delete :destroy, :id => @state_province.to_param
    end

    assert_redirected_to state_provinces_path
  end
end
