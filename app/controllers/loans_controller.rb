class LoansController < ApplicationController

  load_and_authorize_resource

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params.merge(borrower: @current_user))
    if @loan.save
      redirect_to(root_path, notice: 'Loan created')
    else
      render :new
    end
  end

  def show
    @loan = Loan.find(params[:id])
  end

  private

  def loan_params
    params.require(:loan).permit(:id, :principal, :interest_apr, :term_in_months, :reason)
  end
end
