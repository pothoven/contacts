require 'test_helper'

class ContactCompanyDetailsControllerTest < ActionController::TestCase
  setup do
    @contact_company_detail = contact_company_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_company_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_company_detail" do
    assert_difference('ContactCompanyDetail.count') do
      post :create, :contact_company_detail => @contact_company_detail.attributes
    end

    assert_redirected_to contact_company_detail_path(assigns(:contact_company_detail))
  end

  test "should show contact_company_detail" do
    get :show, :id => @contact_company_detail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @contact_company_detail.to_param
    assert_response :success
  end

  test "should update contact_company_detail" do
    put :update, :id => @contact_company_detail.to_param, :contact_company_detail => @contact_company_detail.attributes
    assert_redirected_to contact_company_detail_path(assigns(:contact_company_detail))
  end

  test "should destroy contact_company_detail" do
    assert_difference('ContactCompanyDetail.count', -1) do
      delete :destroy, :id => @contact_company_detail.to_param
    end

    assert_redirected_to contact_company_details_path
  end
end
