class RentalsController < ApplicationController
  before_action :set_castle, only: [:new, :create]

  def new
    @rental = @castle.rentals.build
  end

  def create
    @rental = @castle.rentals.build(rental_params)
    @user = current_user
    @rental.user = @user
    if @rental.save
      redirect_to @rental, notice: "Rental was successfully created."
    else
      render :new
    end
  end

  def index
    @user = current_user
    @rentals = Rental.where(user_id: @user.id)
  end

  def show
    @rental = Rental.find(params[:id])
    days = @rental.end_date - @rental.start_date
    @rental.total_rental = @rental.castle.daily_rate * days.to_f
  end

  private

  def set_castle
    @castle = Castle.find(params[:castle_id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
