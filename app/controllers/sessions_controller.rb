class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: 'Loggied in!'
    else
      flash.now.alert = 'Invalid login credentials - try again!'
      render 'new'
    end
  end

  def show
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "logged out!"
  end
end
