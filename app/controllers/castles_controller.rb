class CastlesController < ApplicationController

  def index
    @castles = Castle.all
  end

  def show
    @castle = Castle.find(params[:id])
  end
end
