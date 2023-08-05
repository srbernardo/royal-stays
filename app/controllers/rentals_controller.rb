class RentalsController < ApplicationController
  before_action :set_castle, only: [:new, :create]
  before_action :set_user, only: [:index, :create]

  def new
    @rental = @castle.rentals.build
  end

  def create
    @rental = @castle.rentals.build(rental_params)
    @rental.user = @user
    if @rental.save
      redirect_to rentals_path, notice: "Rental was successfully created."
    else
      render "castles/show", status: :unprocessable_entity
    end
  end

  def index
    @rentals = Rental.where(user_id: @user.id)
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    redirect_to rentals_path, notice: "Rental was successfully destroyed.", status: :see_other
  end

  private

  def set_castle
    @castle = Castle.find(params[:castle_id])
  end

  def set_user
    @user = current_user
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
