class CastlesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :require_authorization_owner, only: [:edit, :update, :destroy]
  before_action :find_castle, only: [:show, :edit, :update, :destroy, :require_authorization_owner]

  def index
    @castles = Castle.all
  end

  def show
  end

  def earnings
    @castles = current_user.castles
    @earnings_table = []

    @castles.each do |castle|
      castle.rentals.each do |rental|
        days = (rental.end_date - rental.start_date).to_i + 1
        @earnings_table << { castle: castle, rental_id: rental.id, days: days, total_rental: rental.total_rental }
      end
    end

    @total_earnings = @earnings_table.sum { |entry| entry[:total_rental] }
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
        format.html { redirect_to castle_path(@castle), notice: "Castle was successfully created." }
        @castle.save
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @castle.user = @user
    if @castle.update(castle_params)
      redirect_to @castle, notice: "Castle was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @castle.destroy
    redirect_to castles_path, notice: 'Castle was successfully deleted.', status: :see_other
  end

  private

  def castle_params
    params.require(:castle).permit(:name, :description, :address, :daily_rate, :photo)
  end

  def find_castle
    @castle = Castle.find(params[:id])
  end

  def require_authorization_owner
    castle = Castle.find(params[:id])
    unless current_user.id == castle.user_id
      redirect_to castles_path, alert: "Access denied. You need to be the owner of the castle."
    end
  end
end
