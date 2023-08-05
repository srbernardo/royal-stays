class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def search
    @castles = params[:place].present? ? Castle.rental_search(params[:place]) : Castle.all
    return unless params[:checkin].present? || params[:checkout].present?

    if params[:checkin].empty? || params[:checkout].empty?
      redirect_to root_path, notice: "Please fill in both date fields."
    else
      check_checkin_checkout
      rentals = Rental.where("(start_date, end_date) OVERLAPS (?, ?)", params[:checkin], params[:checkout])
      castles_rented_ids = rentals.map(&:castle_id)
      @castles = @castles.where.not(id: castles_rented_ids)
    end
  end

  def check_checkin_checkout
    if Date.parse(params[:checkin]) < Date.today || Date.parse(params[:checkout]) < Date.today
      redirect_to root_path, notice: "Check-in or check-out can't be in the past."
    elsif params[:checkout] < params[:checkin]
      redirect_to root_path, notice: "Check-out must be greater than check-in."
    end
  end
end
