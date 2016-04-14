class UsersController < ApplicationController
  before_action :authorize_user, only: [:show]

  def show
    @user = current_user
    render 'users/show'
  end

  def all_bands_events
    @events = []
    bands = current_user.bands.all
    bands.each do |band|
      User.band_events(@events, band)
    end
    @events.sort! { |a, b| a.date <=> b.date }
  end
end
