class CastlesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @castles = Castle.all
  end

  def show
    @castle = Castle.find(params[:id])
  end

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
        format.html { redirect_to castles_path, notice: "Castle was successfully created." }
        @castle.save
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @castle = Castle.find(params[:id])
    @user = current_user
  end

  def update
    @castle = Castle.find(params[:id])
    @user = current_user
    @castle.user = @user
    if @castle.update(castle_params)
      redirect_to @castle, notice: "Castle was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @castle = Castle.find(params[:id])
    @castle.destroy
    redirect_to castles_path, notice: 'Castle was successfully deleted.', status: :see_other
  end

  private

  def castle_params
    params.require(:castle).permit(:name, :description, :address, :daily_rate, :photo)
  end
end
