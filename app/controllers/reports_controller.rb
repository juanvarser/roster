class ReportsController < ApplicationController
	respond_to :json

	def events_report
		events_ary = []
		band = Band.find_by id: params[:band_id]
		events = band.events.where(completed: true).to_a
		events.each do |event|
			report = Report.find_by event_id: event.id
			event = {
				event_date: event.date,
				payload: JSON.parse(report.payload)
			}
			events_ary << event
		end

		render json: {
			band_id: band.id,
			band_name: band.name,
			management_comission: band.comission,
			events: events_ary
		}
	end

	def events_stats
		@band = current_user.bands.find_by id: params[:band_id]
	end
end
