class CommentsController < ApplicationController

  def new
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to recipe_path(@recipe.id)
    else
      render 'new'
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to recipe_path(@comment[:recipe_id])
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@comment[:recipe_id]) }
      format.json { head :no_content }
    end
  end

  private
  def comment_params
      params.require(:comment).permit(:content, :user_id, :recipe_id)
  end
end
