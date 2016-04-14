class FinancesController < ApplicationController
  before_action :set_finance

  def create
    @finance = @event.finances.new finance_params
    respond_to do |format|
      if @finance.save
        format.html { redirect_to :back, notice: 'Finance was successfully destroyed.' }
        format.js   {}
        format.json { render :show, status: :created, location: @finance }
      else
        format.html { render :new }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @finance = @event.finances.find_by id: params[:id]
    respond_to do |format|
      if @finance.destroy
        format.html { redirect_to :back, notice: 'Finance was successfully destroyed.' }
        format.js   {}
        format.json { render :show, status: :created, location: @finance }
      else
        format.html { render :new }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_finance
    band = current_user.bands.find_by id: params[:band_id]
    @event = band.events.find_by id: params[:event_id]
  end

  def finance_params
    params.require(:finance).permit(:concept_type, :concept, :amount)
  end
end
