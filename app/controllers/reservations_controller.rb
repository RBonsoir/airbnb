class ReservationsController < ApplicationController

  def new
    @apartment = Apartment.find(params[:apartment_id])
    @reservation = Reservation.new
  end

  def create
    @apartment = Apartment.find(params[:apartment_id])
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.apartment = @apartment
    @reservation.save
    @apartment.update(rented: true)
    redirect_to reservation_path(@reservation)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_path(current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:state, :checkin_on, :checkout_on)
  end
end
