class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = "Incorrect Username / Password. Try Again"
      redirect_to '/sign_in'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/sign_in'
  end

end
