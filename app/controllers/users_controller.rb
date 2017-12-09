class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:alert] = "Signed In Succesfully"
      session[:user_id] = user.id
      redirect_to '/'
    else
      if user_params[:password].length
        flash[:alert] = "Password too weak. Must be at least 7 Characters"
        redirect_to sign_up_path
      else
        flash[:alert] = "Incorrect Input(s)"
        redirect_to sign_up_path
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
