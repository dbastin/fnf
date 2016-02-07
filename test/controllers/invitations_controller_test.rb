require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Controller

  setup do
    login_user(people(:sarah))
  end

  test 'new invitation' do
    get :new
    assert :success
    assert assigns(:invitation_code)
  end

  test 'can create invitation' do
    assert_difference('Invitation.count', 1) do
      code = loans(:one).invitation_code
      post :create, invitation_code: { code: code}
    end
    assert_redirected_to root_path
  end

  test 'cannot create fake invitations' do
    assert_difference('Invitation.count', 0) do
      post :create, invitation_code: { code: 'ABC123' }
    end
    assert assigns(:invitation_code).errors[:code].any?
  end
end
