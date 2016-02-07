class WelcomeController < ApplicationController
  layout 'marketing'

  skip_before_filter :require_login

  def show
  end
end
