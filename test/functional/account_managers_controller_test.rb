require 'test_helper'

class AccountManagersControllerTest < ActionController::TestCase
  setup do
    @account_manager = account_managers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_managers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_manager" do
    assert_difference('AccountManager.count') do
      post :create, account_manager: { screen_name: @account_manager.screen_name }
    end

    assert_redirected_to account_manager_path(assigns(:account_manager))
  end

  test "should show account_manager" do
    get :show, id: @account_manager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_manager
    assert_response :success
  end

  test "should update account_manager" do
    put :update, id: @account_manager, account_manager: { screen_name: @account_manager.screen_name }
    assert_redirected_to account_manager_path(assigns(:account_manager))
  end

  test "should destroy account_manager" do
    assert_difference('AccountManager.count', -1) do
      delete :destroy, id: @account_manager
    end

    assert_redirected_to account_managers_path
  end
end
