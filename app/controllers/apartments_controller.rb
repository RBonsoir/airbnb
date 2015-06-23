class ApartmentsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new
    @apartment.save
    redirect_to 'root_path'
  end

  def show
  end

  def index
    @apartments = Apartment.all
    @reservation = Reservation.new
    # @markers = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
    #   marker.lat apartment.latitude
    #   marker.lng apartment.longitude
    # end
  end

  private

  def find_apartment
    @apartment = Apartment.find(params[:id])
  end

  def post_params
    params.require(:apartment).permit(:title, :address, :price, :picture)
  end
end




