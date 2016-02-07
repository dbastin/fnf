class InvitationsController < ApplicationController

  def new
    @invitation_code = InvitationCode.new
  end

  def create
    loan = Loan.find_by_invitation_code(invitation_params[:code])
    if loan.present?
      @current_user.invitations.create!(loan: loan)
      redirect_to root_path
    else
      @invitation_code = InvitationCode.new
      @invitation_code.errors[:code] = "There aren't any loans that match that code. Try again?"
      render :new
    end
  end

  private

  def invitation_params
    params.require(:invitation_code).permit(:code)
  end

end