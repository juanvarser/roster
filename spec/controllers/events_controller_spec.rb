require 'rails_helper'
require 'pry'

RSpec.describe EventsController, type: :controller do
  before do
    user = User.create(
      name:'fake',
      email:'faker@faker.es',
      password:'ironhack'
      )
    
    band = Band.create(
      name: 'The Scatergories',
      description: 'Lorem Ipsum',
      cache: 4000,
      user_id: user.id,
      comission: 15,
    )

    venue = Venue.create(
      name: 'Fillmore',
      address:'Fake Street 123',
      city: 'San Francisco',
      email: '1@2.es',
      phone: '123456899',
      cache: 100,
      contact_name: 'John Doe',
      user_id: user.id
      )

    event = Event.create(
      price: 15,
      date: Date.today,
      time: Time.now,
      band_id: band.id,
      venue_id: venue.id,
      event_type: 'band_cache',
      completed: false
      )

    @user = User.last
    sign_in @user
    @band = @user.bands.last
    @events = @band.events.all

  end

	describe "GET #index by date ASC" do

    it "populates an array of events by an specific band" do
      @events = @band.events.all.order(date: 'ASC')
      get :index, band_id: @band.id, user_id: @user.id
      expect(assigns(:events)).to eq(@events)
    end

  end

  describe "GET #show of an specific band event and self actions" do
  	before do
  		@event = @events.last
  	end

  	it "shows a band event" do
  		get :show, band_id: @band.id, user_id: @user.id, id: @event.id
  		expect(assigns(:event)).to eq(@event)
  	end

  	it "closes a band event" do
  		get :show, band_id: @band.id, user_id: @user.id, id: @event.id
  		@event.event_completed
  		expect(@event.completed).to be true
  	end

    # it 'matches a JSON closed event' do
    #   get :get_event_info, band_id: @band.id, user_id: @user.id, id: @event.id
    #   @event.event_completed
    #   Event.generate_report(@event.id,@event.date,payload.to_json)
    #   expect(response).to be_success
    # end

  end

end
