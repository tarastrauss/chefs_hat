class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "You've create a new Recipe!"
      redirect_to hat_path(@recipe[:hat_id])
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:notice] = "You have successfully updated your recipe!"
      redirect_to hat_path(@recipe.hat_id)
    else
      render 'new'
    end
  end

  def destroy
  end

  private


  def recipe_params
      params.require(:recipe).permit(:instructions, :cook_method, :cook_time, :cook_temp, :image_uri, :user_id, :hat_id, :name)
  end
end
