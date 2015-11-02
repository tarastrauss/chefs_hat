class HatsController < ApplicationController

  def new
  end

  def show
    @hat = Hat.find(params[:id])
  end

end
