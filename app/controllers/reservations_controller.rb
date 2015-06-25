class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.save
    redirect_to reservation_path(@reservation)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user, :apartment, :state, :checkin_on, :checkout_on)
  end
end
