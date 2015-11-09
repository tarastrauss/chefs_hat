class UsersController < ApplicationController
  before_action :authenticate, only: [:show]
  before_action :authorize, only: [:show]

  def search
    if params[:search]
      @users = User.search(params[:search]).order(:created_at).reverse
    else
      @users = nil
    end
    @hat = Hat.find(params[:hat_id])
    render 'hats/show'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
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
    redirect_to user_path(session[:user_id]) if @user != current_user
  end

end
