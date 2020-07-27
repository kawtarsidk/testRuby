require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
    @account = Account.new(login: 'sidk', email: 'sidk@example.com',
                            password: 'sidk')
  end

  test 'account should be valid' do
    assert @account.valid?
  end

  test 'login should be present' do
    @account.login = ''
    assert_not @account.valid?
  end

  test 'email should be present' do
    @account.email = ''
    assert_not @account.valid?
  end

  test 'login should not be too long' do
    @account.login = 'a' * 26
    assert_not @account.valid?
  end

  test 'email addresses should be unique' do
    duplicate_account = @account.dup
    @account.save
    assert_not duplicate_account.valid?
  end

  test 'password should have a minimum length' do
    @account.password = @account.password = 'a' * 5
    assert_not @account.valid?
  end
  
end
