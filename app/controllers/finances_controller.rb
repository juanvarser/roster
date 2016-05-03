class FinancesController < ApplicationController
  before_action :set_finance, except: [:create,:show]

  def create
    @band = current_user.bands.find(params[:band_id])
    @event = @band.events.find(params[:event_id])
    @finance = @event.finances.new finance_params
    respond_to do |format|
      if @finance.save
        format.html {}
        format.js {flash[:"is-success"] = 'Finance created!'}
      else
        format.html { render :new }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @band = current_user.bands.find(params[:band_id])
    @event = @band.events.find(params[:event_id])
    @finance = @event.finances.find(params[:id])
  end

  def destroy
    @finance = @event.finances.find_by(params[:id])
    respond_to do |format|
      if @finance.destroy
        format.html { redirect_to :back}
        format.js   {}
        format.json { render :show, status: :created, location: @finance }
        flash[:"is-success"] = 'Finance deleted!'
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
