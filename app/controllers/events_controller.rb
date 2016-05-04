class EventsController < ApplicationController
  before_action :set_band

  def index
    @events = @band.events.all.order(date: 'ASC')
  end

  def new
    @venue = current_user.venues.all
    @event = @band.events.new
  end

  def create
    @event = @band.events.new event_params
    if @event.save
      if @event.event_type == 'band_cache'
        Event.add_band_cache_to_finances(@event.id, @band.cache)
      end
      Event.add_venue_cache_to_finances(@event.id, @event.venue_id)

      redirect_to user_band_event_path(id:@event.id)
      flash[:"is-success"] = 'Rock on!You have created a new event'
    else
      @errors = @event.errors.full_messages
      render :new
      flash[:"is-alert"] = 'Oops!Something went wrong...'
    end
  end

  def show
    @event = @band.events.find(params[:id])
    @venue = Venue.find_by id: @event.venue_id
    @finance = @event.finances.new
    @members = @band.members.all
  end

  def edit
    @event = @band.events.find(params[:id])
  end

  def update
    @event = @band.events.find(params[:id])
    if @event.update event_params
      @event.finances.find_by(concept: 'Venue Cache').destroy
      Event.add_venue_cache_to_finances(@event.id, @event.venue_id)
      flash[:"is-success"] = 'Great! You have updated a new report event'
      redirect_to user_band_event_path @event
    else
      @errors = @event.errors.full_messages
      render :edit
    end
  end

  def destroy
    @event = @band.events.find(params[:id])
    @event.destroy
    redirect_to user_band_events_path
  end

  def close_event
    @event = @band.events.find(params[:event_id])
    @event.event_completed

    if @event.save
      redirect_to user_band_events_path
      flash[:"is-success"] = 'Rock on!You have closed this event'
    else
      flash[:"is-alert"] = 'Oops! Something went wrong'
      render :show
    end
  end

  def get_route_map
    @event = @band.events.find(params[:id])
    @example = 'Hello World!'
    render pdf: @example
  end

  private
  def set_band
    @band = current_user.bands.find(params[:band_id])
  end

  def event_params
    params.require(:event).permit(:price, :date, :time, :image, :venue_id, :event_type)
  end

end
