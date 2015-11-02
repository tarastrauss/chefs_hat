class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @hats = @user.hats
  end

  private
    # Implement Strong Params
  def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end
