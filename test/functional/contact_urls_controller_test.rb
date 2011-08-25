require 'test_helper'

class ContactUrlsControllerTest < ActionController::TestCase
  setup do
    @contact_url = contact_urls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_urls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_url" do
    assert_difference('ContactUrl.count') do
      post :create, :contact_url => @contact_url.attributes
    end

    assert_redirected_to contact_url_path(assigns(:contact_url))
  end

  test "should show contact_url" do
    get :show, :id => @contact_url.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contact_url.to_param
    assert_response :success
  end

  test "should update contact_url" do
    put :update, :id => @contact_url.to_param, :contact_url => @contact_url.attributes
    assert_redirected_to contact_url_path(assigns(:contact_url))
  end

  test "should destroy contact_url" do
    assert_difference('ContactUrl.count', -1) do
      delete :destroy, :id => @contact_url.to_param
    end

    assert_redirected_to contact_urls_path
  end
end
