class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def search
    @castles = params[:place].present? ? Castle.rental_search(params[:place]) : Castle.all
    return unless params[:checkin].present? && params[:checkout].present?

    checkin = params[:checkin]
    checkout = params[:checkout]
    rentals = Rental.where("(start_date, end_date) OVERLAPS (?, ?)", checkin, checkout)
    castles_rented_ids = rentals.map(&:castle_id)
    @castles = @castles.where.not(id: castles_rented_ids)
  end
end
