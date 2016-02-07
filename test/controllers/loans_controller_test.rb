require 'test_helper'

class LoansControllerTest < ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Controller

  setup do
    login_user(people(:fred))
  end

  test 'should get new' do
    get :new
    assert_response :success
    assert assigns(:loan)
  end

  test 'can create' do
    assert_difference('Loan.count', 1) do
      post :create, loan: {
        principal: '1000',
        interest_apr: '9.99',
        term_in_months: '36',
        reason: 'I really need food.'
      }
    end
    assert_redirected_to root_path
    assert_equal 'Loan created', flash[:notice]
  end

  test 'requires valid input' do
    assert_difference('Loan.count', 0) do
      post :create, loan: {
        principal: 'Something completely invalid'
      }
    end
    assert_template :new
    assert (assigns(:loan).invalid?)
  end

  test 'can show' do
    get :show, id: loans(:one)
    assert_template :show
    assert assigns(:loan)
  end
end