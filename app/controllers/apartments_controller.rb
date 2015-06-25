class ApartmentsController < ApplicationController
  before_action :find_apartment, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def new
    @apartment = Apartment.new
  end

  def create
    # @user = User.find(params[:user_id])
    @apartment = current_user.apartments.build(apartment_params)
    # @apartment.user = current_user
    if @apartment.save
      redirect_to apartment_path(@apartment)
    else
      render 'apartments/new'
    end
  end

  def show
    @apartment_coordinates = { lat: @apartment.latitude, lng: @apartment.longitude }
  end


  def index
    @apartments = Apartment.all
    @reservation = Reservation.new

    if params[:city].present?
      @apartments = @apartments.near(params[:city], 5)
    end


    if params[:check_in].present?
      @apartments = Apartment.where(:check_in == params[:checkin_on]).order("created_at DESC")
      if @apartments.empty?
        flash[:error] = "Could not find anything"
      end
    else
      @apartments = Apartment.order("created_at DESC")
    end

    if params[:check_out].present?
      @apartments = Apartment.where(:check_out == params[:checkout_on]).order("created_at DESC")
      if @apartments.empty?
        flash[:error] = "Could not find anything"
      end
    else
      @apartments = Apartment.order("created_at DESC")
    end

    if params[:capacity].present?
      @apartments = Apartment.where(:capacity == params[:capacity]).order("created_at DESC")
      if @apartments.empty?
        flash[:error] = "Could not find anything"
      end
    else
      @apartments = Apartment.order("created_at DESC")
    end

    @markers = Gmaps4rails.build_markers(@apartments) do |apartment, marker|
      marker.lat apartment.latitude
      marker.lng apartment.longitude
    end
  end

  def edit
  end

  def update
    @apartment.update(apartment_params)
    redirect_to apartment_path(@apartment)
  end

  private

  def find_apartment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params.require(:apartment).permit(:title, :description, :address, :price, :picture, :capacity)
  end
end




