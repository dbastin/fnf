class LoginController < ApplicationController
  layout 'minimal'
  skip_before_filter :require_login, :except => :destroy

  def create
    if @person = login(params[:email], params[:password], params[:remember])
      redirect_back_or_to(:root)
    else
      redirect_to(:login, notice: 'Login failed')
    end
  end

  def destroy
    logout
    redirect_to(:login, notice: 'Thanks for using Kazoo - Friends & Family')
  end
end
