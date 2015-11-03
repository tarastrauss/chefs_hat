class HatsController < ApplicationController

  def new
    @hat = Hat.new
  end

  def create
    @hat = current_user.hats.new(hat_params)
    if @hat.save
      flash[:notice] = "You've create a new Hat!"
      redirect_to user_path(session[:user_id]), notice: 'New hat!'
    else
      render 'new'
    end
  end

  def show
    @hat = Hat.find(params[:id])
    @memberships = @hat.memberships
    @new_mem = @hat.memberships.new(new_mem_params)
    if @new_mem.save
      flash[:notice] = "You've added a new member!"
      redirect_to hat_show_path, notice: "You've added a new member!"
    else
      render 'new'
    end
  end

  def destroy
    @hat = Hat.find(params[:id])
      @hat.destroy
      respond_to do |format|
        format.html { redirect_to user_path(session[:user_id]), notice: 'Hat was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

  private

  def new_mem_params
      params.require(:membership).permit(:user_id)
  end

  def hat_params
      params.require(:hat).permit(:name)
  end

end
