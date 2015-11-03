class MembershipsController < ApplicationController

  def create
    @user = User.find_by(username: new_mem_params[:username])
    @hat = Hat.find(new_mem_params[:hat_id])
    @new_mem = @hat.memberships.new(user_id: @user.id)
    if @new_mem.save
      flash[:notice] = "You've added a new member!"
      redirect_to hat_path(new_mem_params[:hat_id]), notice: "You've added a new member!"
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def new_mem_params
      params.require(:membership).permit(:username, :hat_id)
  end

end
