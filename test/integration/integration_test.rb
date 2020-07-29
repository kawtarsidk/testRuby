require 'test_helper'

class IntegrationTest < ActionDispatch::IntegrationTest

  def setup
    @account = accounts(:kawtar)
    @other_account = accounts(:sidk)
  end

  test 'should get new' do
    get new_account_path #named root
    assert_response :success
  end

  test 'should redirect index when not logged in' do
    get accounts_path #named root
    assert_redirected_to login_url
  end

  test 'should redirect edit when not logged in' do
    get edit_account_path(@account)
    refute flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect update when not logged in' do
    patch account_path(@account), params: { account: { login: @account.login,
                                                       email: @account.email, password: @account.password } }
    refute flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect delete when not logged in' do
    assert_no_difference 'Account.count' do
      delete account_path(@account)
    end
    assert_redirected_to login_url
  end


end
