require 'rails_helper'

RSpec.describe Event, type: :model do
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
    @band = @user.bands.last
    @events = @band.events.all
  end

  describe "Events methods" do
  	before do
  		@event = @events.last
  	end

  	it "matches all on tour events" do
  		on_tour = @events.on_tour
  		expect(on_tour).to eq(1)
  	end

  	it "matches all completed events,0 in this case, for list in index" do 
  		completed = @events.expired
  		expect(completed).to eq(0)
  	end

    it "generates an event report" do
  		@event.event_completed
  		payload = {
  			id: 128,
  			concept: "Venue Cache",
  			amount: 5000,
  			created_at: "2016-03-28 18:33:10",
  			updated_at: "2016-03-28 18:33:10",
  			concept_type: "Expense",
  			event_id: 104
  		}

  		Event.generate_report(@event.id,@event.date,payload.to_json)
  		report = Report.last
  		expect(report.event_id).to equal(@event.id)
    end

    it "adds venue cache to a new event finances" do
    	venue = Venue.last
    	Event.add_venue_cache_to_finances(@event.id,venue.id)
    	@finance = @event.finances.last
    	expect(@finance.amount).to equal(venue.cache)
    end

    it "adds band cache to a new event finances" do
    	Event.add_band_cache_to_finances(@event.id,@band.cache)
    	@finance = @event.finances.last
    	expect(@finance.amount).to equal(@band.cache)
    end

  end

end
