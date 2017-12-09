class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      flash[:alert] = "Succesfully Signed In"
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = "Incorrect Username / Password. Try Again"
      redirect_to '/sign_in'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = "Succesfully Signed Out"
    redirect_to '/sign_in'
  end

end
