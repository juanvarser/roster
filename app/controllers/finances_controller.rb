class FinancesController < ApplicationController
  before_filter :authorize_user
  before_action :set_finance,except: [:create,:destroy]

  def create
    @band = current_user.bands.find(params[:band_id])
    @event = @band.events.find(params[:event_id])
    @finance = @event.finances.new finance_params
    respond_to do |format|
      if @finance.save
        format.js {flash[:"is-success"] = 'Finance created!'}
        format.html {
          redirect_to user_band_event_path(@event)
          flash[:"is-success"] = 'Rock on!You have created a new member'
        }
      else
        format.html { render :new }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @finance = @event.finances.find(params[:id])
  end

  def destroy
    @band = current_user.bands.find(params[:band_id])
    @event = @band.events.find(params[:event_id])
    @finance = @event.finances.find(params[:id])
    respond_to do |format|
      if @finance.destroy
        format.js {}
        format.html {
          redirect_to user_band_event_path(@event)
          flash[:"is-success"] = 'Finance Deleted'
        }
        # format.json { render :show, status: :created, location: @finance }
      else
        format.html { render :new }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_finance
    @band = current_user.bands.find([:band_id])
    @event = @band.events.find(params[:event_id])
  end

  def finance_params
    params.require(:finance).permit(:concept_type, :concept, :amount)
  end
end
