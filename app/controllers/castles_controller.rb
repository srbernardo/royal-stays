class CastlesController < ApplicationController

  def edit
    @castle = Castle.find(params[:id])
    @user = current_user
  end

  def update
    @castle = Castle.find(params[:id])
    @user = current_user
    @castle.user = @user
    if @castle.update(castle_params)
      redirect_to @castle, notice: 'Castelo atualizado corretamente'
    else
      render :edit
    end
  end

  private

  def castle_params
    params.require(:castle).permit(:name, :address, :description, :daily_rate)
  end

end
