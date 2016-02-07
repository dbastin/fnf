class LendersController < ApplicationController
  include PeopleControllerUtils

  layout 'minimal'
  skip_before_filter :require_login

  def new
    loan = Loan.find_by_invitation_code!(params[:invitation_code])
    @lender = Lender.new
    @lender.invitations.build(loan: loan)
  end

  def create
    @lender = Lender.new(signup_params)
    save @lender
  end

  private

  def signup_params
    params.require(:lender).permit(:name, :email, :password, :password_confirmation, invitations_attributes: [:loan_id])
  end
end