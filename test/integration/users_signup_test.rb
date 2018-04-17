require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do #このブロックの前後でUser.countが変わらないことのテスト
      post signup_path, params: { user: { name: '',
                          email: "user@invaild",
                          password: "foo",
                          password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    assert_select 'div.alert'
  end
end
