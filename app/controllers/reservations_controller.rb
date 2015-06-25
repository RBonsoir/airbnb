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
    redirect_to reservation_path(@reservation)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_path(current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:state, :checkin_on, :checkout_on)
  end
end

# on an apartment show page
# click on "book" button
# creates a new reservation, linked to apartment_id and user_id (renter)
# state is : pending
# redirects to user profile (the reservation appears on the right)
# user(renter) show page: shows the reservation on the left
# possibility to click on the
