require 'test_helper'

class ContactPhonesControllerTest < ActionController::TestCase
  setup do
    @contact_phone = contact_phones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_phones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_phone" do
    assert_difference('ContactPhone.count') do
      post :create, :contact_phone => @contact_phone.attributes
    end

    assert_redirected_to contact_phone_path(assigns(:contact_phone))
  end

  test "should show contact_phone" do
    get :show, :id => @contact_phone.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contact_phone.to_param
    assert_response :success
  end

  test "should update contact_phone" do
    put :update, :id => @contact_phone.to_param, :contact_phone => @contact_phone.attributes
    assert_redirected_to contact_phone_path(assigns(:contact_phone))
  end

  test "should destroy contact_phone" do
    assert_difference('ContactPhone.count', -1) do
      delete :destroy, :id => @contact_phone.to_param
    end

    assert_redirected_to contact_phones_path
  end
end
