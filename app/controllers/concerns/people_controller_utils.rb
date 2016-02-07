module PeopleControllerUtils
  def save(person)
    if person.save
      login(signup_params[:email], signup_params[:password])
      redirect_to root_path
    else
      render :new
    end
  end
end