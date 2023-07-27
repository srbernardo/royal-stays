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
        format.html { redirect_to root_path, notice: "castle was successfully created." }
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
      redirect_to @castle, notice: 'Castelo atualizado corretamente'
    else
      render :edit
    end
  end

  private

  def castle_params
    params.require(:castle).permit(:name, :description, :address, :daily_rate)
  end
end
