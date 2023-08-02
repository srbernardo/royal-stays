class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def search
    @castles = Castle.rental_search(params[:place])
    date_overlaps(params[:checkin], params[:checkout])
  end

  # def date_overlaps(start, finish)
  #   where("#{start}, #{finish} OVERLAPS (?,?)", start, finish)
  # end
end
