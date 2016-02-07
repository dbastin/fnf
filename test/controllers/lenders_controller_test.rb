require 'test_helper'

class LendersControllerTest < ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Controller

  setup do
    @loan = loans(:one)
    @newbie = {
      name: 'Billy Baxter',
      email: 'billy@example.com',
      password: '123123',
      password_confirmation: '123123',
      invitations_attributes: {
        '0' => {
          id: @loan.id
        }
      }
    }
  end

  test 'new lender' do
    get :new, invitation_code: @loan.invitation_code
    assert :success
    person = assigns(:lender)
    assert_equal 'Lender', person.type
    assert person.invitations.any?
  end

  test 'can create lender' do
    assert_difference('Lender.count + Invitation.count', 2) do
      post :create, lender: @newbie
    end
    assert_equal 'Lender', Person.last.type
    assert_redirected_to root_path
  end
end
