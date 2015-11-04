class MembershipsController < ApplicationController

  def create
    @user = User.find_by(username: new_mem_params[:username])
    @hat = Hat.find(new_mem_params[:hat_id])
    @new_mem = @hat.memberships.new(user_id: @user.id)
    @memberships = Membership.all

    @memberships.each do |memeber|
      if @hat.memberships.find_by(user_id: @user.id)
        flash.now[:notice] = "You've already added that chef!"
      else
        @new_mem.save
        flash.now[:notice] = "You've added a new chef!"
      end
    end
    # redirect_to :controller => 'hats', :action => 'show', :id => @hat.id
    redirect_to hat_path(new_mem_params[:hat_id])
  end


  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    respond_to do |format|
      format.html { redirect_to hat_path(@membership.hat_id), notice: 'Chef was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def new_mem_params
      params.require(:membership).permit(:username, :hat_id)
  end

end
