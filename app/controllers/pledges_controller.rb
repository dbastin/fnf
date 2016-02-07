class PledgesController < ApplicationController

  load_and_authorize_resource

  def new
    loan = Loan.find_by_invitation_code(params[:id])
    @pledge = Pledge.new
    @pledge.loan = loan
  end

  def create
    @pledge = Pledge.new(pledge_params.merge(lender: @current_user))
    if @pledge.save
      redirect_to(root_path, notice: 'Pledge created')
    else
      render :new
    end
  end

  def show
    @pledge = Pledge.find(params[:id])
  end

  private

  def pledge_params
    params.require(:pledge).permit(:id, :loan_id, :amount)
  end
end
