require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Controller

  test 'login required' do
    get :show
    assert_redirected_to welcome_path
  end

  test 'should get show' do
    login_user(people(:fred))
    get :show
    assert_response :success
  end
end