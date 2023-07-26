class CastlesController < ApplicationController
  def new
    @castle = Castle.new
    @user = current_user
  end

  def create
    @castle = Castle.new(castle_params)
    @user = current_user
    @castle.user = @user

    respond_to do |format|
      if @castle.save
        format.html { redirect_to root_path, notice: "castle was successfully created." }
        @castle.save
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end

  end

  private

  def castle_params
    params.require(:castle).permit(:name, :description, :address, :daily_rate)
  end
end
