module EventsHelper
  def get_finance(event_id)
    Finance.all.where(event_id: event_id)
  end

  # def completed(params)
  #   params.where(completed: false)
  # end
  #
  # def expired(params)
  #   params.where(completed: true)
  # end
end
