require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Controller

  test 'should get show' do
    get :show
    assert_response :success
  end

  test 'login failure' do
    get :create
    assert_redirected_to login_path
  end

  test 'logging in' do
    person = people(:fred)
    post :create, {email: person.email, password: '123123'}
    assert session[:user_id]
  end

  test 'logging out' do
    login_user people(:fred)
    assert session[:user_id]
    get :destroy
    assert_redirected_to login_path
    refute session[:user_id]
  end
end