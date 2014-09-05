class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash.now[:success] = t 'user.welcome'
      redirect_to user
    else
      message = user ? t('user.incorrect_password') : t('user.incorrect_email')
      flash.now[:warning] = message
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
