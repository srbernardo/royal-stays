class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def search
    place = "%#{params[:place]}%"
    @castles = Castle.where('name ILIKE ?', place) | Castle.where('address ILIKE ?', place)
  end
end
