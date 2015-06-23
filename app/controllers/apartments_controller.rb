class ApartmentsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
  end

  def show
  end

  def index
    @apartments = Apartment.all
  end
end




