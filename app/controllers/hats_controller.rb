class HatsController < ApplicationController

  def new
    @hat = Hat.new
  end

  def create
    user = User.find_by(username: params[:username])
    @hat = user.hats.new(hat_params)
    if @hat.save
      flash[:notice] = "You've create a new Hat!"
      redirect_to user_path(session[:user_id]), notice: 'New hat!'
    else
      render 'new'
    end
  end

  def show
    @hat = Hat.find(params[:id])
  end

  private
  def hat_params

      params.require(:hat).permit(:name, :user_id)
  end

end
