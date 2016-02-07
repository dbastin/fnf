require 'test_helper'

class PledgesControllerTest < ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Controller

  setup do
    login_user(people(:jessica))
  end

  test 'should get new' do
    get :new, id: loans(:one).invitation_code
    assert_response :success
    assert assigns(:pledge).loan
  end

  test 'should create' do
    assert_difference('Pledge.count', 1) do
      post :create, pledge: {
        loan_id: loans(:one).id,
        amount: '10'
      }
    end
    assert_redirected_to root_path
    assert_equal 'Pledge created', flash[:notice]
  end

  test 'requires valid input' do
    assert_difference('Pledge.count', 0) do
      post :create, pledge: {
        loan_id: loans(:one).id,
        amount: '-10'
      }
    end
    assert_template :new
    assert (assigns(:pledge).invalid?)
  end

  test 'can show' do
    get :show, id: pledges(:one)
    assert_template :show
    assert assigns(:pledge)
  end
end
