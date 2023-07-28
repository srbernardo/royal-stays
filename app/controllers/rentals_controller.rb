class RentalsController < ApplicationController
  def index
    @user = current_user
    @rentals = Rental.where(user_id: @user.id)
  end

  def show
    @rental = Rental.find(params[:id])
    days = @rental.end_date - @rental.start_date
    @rental.total_rental = @rental.castle.daily_rate * days.to_f
  end
end
