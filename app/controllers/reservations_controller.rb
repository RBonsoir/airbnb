class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.save
    redirect_to reservation_path(@reservation)
  end

  def destroy
    @reservation = reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_path(current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user, :apartment, :state, :checkin_on, :checkout_on)
  end
end

# on an apartment show page
# click on "book" button
# creates a new reservation, linked to apartment_id and user_id (renter)
# state is : pending
# redirects to user profile (the reservation appears on the right)
# user(renter) show page: shows the reservation on the left
# possibility to click on the
