require 'test_helper'

class BorrowersControllerTest < ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Controller

  setup do
    @newbie = {
      name: 'Billy Baxter',
      email: 'billy@example.com',
      password: '123123',
      password_confirmation: '123123',
    }
  end

  test 'new borrower' do
    get :new
    assert :success
    assert assigns(:borrower)
  end

  test 'can create borrower' do
    assert_difference('Borrower.count', 1) do
      post :create, borrower: @newbie
    end
    assert_redirected_to root_path
  end

  test 'cannot reuse emails' do
    assert_difference('Borrower.count', 0) do
      post :create, borrower: @newbie.merge(email: 'fred@example.com')
    end
    assert assigns(:borrower).errors[:email].any?
  end

  test 'passwords match' do
    assert_difference('Borrower.count', 0) do
      post :create, borrower: @newbie.merge(password_confirmation: '321321')
    end
    assert assigns(:borrower).errors[:password_confirmation].any?
  end

end
