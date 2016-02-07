class BorrowersController < ApplicationController
  include PeopleControllerUtils

  layout 'minimal'
  skip_before_filter :require_login

  def new
    @borrower = Borrower.new
  end

  def create
    @borrower = Borrower.new(signup_params)
    save @borrower
  end

  private

  def signup_params
    params.require(:borrower).permit(:name, :email, :password, :password_confirmation)
  end

end