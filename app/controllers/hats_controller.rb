class HatsController < ApplicationController

  def new
    @hat = Hat.new
  end

  def create
    @hat = current_user.hats.new(hat_params)
    if @hat.save
      @hat.memberships.create(user_id: current_user.id)
      flash[:notice] = "You've create a new Hat!"
      redirect_to user_path(session[:user_id]), notice: 'New hat!'
    else
      render 'new'
    end
  end

  def show

    @hat = Hat.find(params[:id])
    @memberships = @hat.memberships
    @recipes = Recipe.where(hat_id: @hat.id)
  end

  def recipe
    @recipe = Recipe.new
  end


  def destroy
    @hat = Hat.find(params[:id])
    @memberships = Membership.where(hat_id: @hat.id)
    @memberships.each do |membership|
      membership.destroy
    end
    @hat.destroy
    respond_to do |format|
      format.html { redirect_to user_path(session[:user_id]), notice: 'Hat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private



  def hat_params
      params.require(:hat).permit(:name, :user_id)
  end

  def recipe_params
      params.require(:recipe).permit(:instructions, :cook_method, :cook_time, :image_uri, :user_id, :hat_id, :name)
  end

end
