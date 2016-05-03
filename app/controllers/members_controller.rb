class MembersController < ApplicationController
  before_action :set_members

  def new
    @member = @band.members.new member_params
  end

  def create
    @member = @band.members.new member_params
    respond_to do |format|
      if @member.save
        format.html {}
        format.js {flash[:"is-success"] = 'Member Added'}
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member = @band.members.find(params[:id])
    @member.destroy
    redirect_to user_band_path id: params[:band_id]
  end

  private

  def set_members
    @band = current_user.bands.find(params[:band_id])
  end

  def member_params
    params.require(:member).permit(:name, :instrument, :gear, :special_food)
  end
end
