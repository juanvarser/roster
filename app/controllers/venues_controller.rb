class VenuesController < ApplicationController
  before_filter :authorize_user

  def index
    @venues = current_user.venues.all
  end

  def new
    @venue = current_user.venues.new
  end

  def create
    @venue = current_user.venues.new venue_params
    if @venue.save
      flash[:"is-success"] = 'Rock on!You have created a new venue'
      redirect_to user_venues_path
    else
      flash[:alert] = 'Oops!Something went wrong...'
      render 'new'
    end
  end

  def update_venue_info
    venue = current_user.venues.find_by id: params[:venue_id]
    venue.address = params[:venue_address] unless params[:venue_address].nil?
    venue.cache = params[:venue_cache] unless params[:venue_cache].nil?
    venue.name = params[:venue_name]

    render status: 200, json: venue
    venue.save
  end

  def show
    @venue = current_user.venues.find(params[:id])
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :city, :cache, :email, :phone, :contact_name)
  end
end
