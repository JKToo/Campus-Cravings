class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end

  def sign_in
    session[:user_id] = nil
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in"
    else
      redirect_to sign_in_path, alert: "Invalid Email or Password"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
