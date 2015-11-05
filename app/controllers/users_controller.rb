class UsersController < ApplicationController
  before_action :authenticate, only: [:show]
  before_action :authorize, only: [:show]

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


  # def destroy

  #   @hats = Hat.where(user_id: current_user.id)
  #   @memberships = Membership.where(user_id: current_user.id)
  #   @memberships.each do |membership|
  #     membership.destroy
  #   end
  #   @hats.each do |hat|
  #     hat.destroy
  #   end
  #   User.find(params[:id]).delete
  #   session[:user_id] = nil
  #   flash[:notice] = 'Account Deleted'
  #   redirect_to root_path
  # end
  # <%= button_to 'Delete Account', user_path, method: :delete %>

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have successfully updated your profile!"
      redirect_to edit_user_path
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
      params.require(:user).permit(:first_name, :last_name, :username, :email, :image, :password, :password_confirmation)
  end

  def authenticate
    redirect_to new_session_path, alert: 'You must be logged in to continue!' if current_user.nil?
  end

  def authorize
    @user = User.find(params[:id])
    redirect_to user_path(session[:user_id]), alert: 'You can only view your own hats!' if @user != current_user
  end

end
