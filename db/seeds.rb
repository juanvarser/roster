# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	user = User.find_by id: "7"

	knockout = user.venues.create(
		name:"The Knockout",
		address:"Fake Street 123",
		city:"San Francisco",
		email: "info@knockout.us",
		phone:"123456789",
		cache: 500,
		contact_name: "John Doe",
		)

	fillmore = user.venues.create(
		name:"Fillmore East",
		address:"Fillmore Street 123",
		city:"San Francisco",
		email: "info@fillmore.us",
		phone:"123456789",
		cache: 800,
		contact_name: "Phil Moore",
		)

	westmoreland = user.venues.create(
		name:"Westmoreland",
		address:"Valencia Street 1",
		city:"San Francisco",
		email: "info@westmoreland.us",
		phone:"123456789",
		cache: 800,
		contact_name: "Gregory Isaacs",
		)
