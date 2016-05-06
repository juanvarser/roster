class MembersController < ApplicationController
  before_filter :authorize_user
  before_action :set_members

  def index
    @members = @band.members
  end

  def new
    @member = @band.members.new member_params
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def create
    @member = @band.members.new member_params
    respond_to do |format|
      if @member.save
        format.js { flash[:"is-success"] = 'Rock on!You have created a new member' }
        format.html do
          redirect_to user_band_path(@band)
          flash[:"is-success"] = 'Rock on!You have created a new member'
        end
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member = @band.members.find(params[:id])
    respond_to do |format|
      if @member.destroy
        format.js {}
        format.html { flash[:"is-success"] = 'Rock on!You have created a new band' }
      else
        format.html {}
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_members
    @band = current_user.bands.find(params[:band_id])
  end

  def member_params
    params.require(:member).permit(:name, :instrument, :gear, :special_food)
  end
end
