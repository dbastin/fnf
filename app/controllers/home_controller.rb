class HomeController < ApplicationController

  skip_before_filter :require_login

  def show
    redirect_to welcome_path unless logged_in?
  end
end
