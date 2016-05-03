class BandsController < ApplicationController
  before_action :set_band, only: [:show, :update, :destroy]

  def index
    @bands = current_user.bands.order(id: :asc)
  end

  def new
    @band = current_user.bands.new
  end

  def create
    @band = current_user.bands.new band_params
    @members = @band.members
    if @band.save
      flash[:"is-success"] = 'Rock on!You have created a new band'
      redirect_to user_bands_path
    else
      @errors = @band.errors.full_messages
      flash[:"is-alert"] = 'Oops!Something went wrong...'
      render 'new'
    end
  end

  def show
    @members = @band.members.new
  end

  def update
  end

  def destroy
    @band.destroy
    redirect_to user_bands_path
  end

  private
  def set_band
    @band = current_user.bands.find(params[:id])
  end

  def band_params
    params.require(:band).permit(
      :name, :description, :cache, :comission, :image,
      members_attributes: [:name, :instrument, :gear, :special_food]
    )
  end
end
