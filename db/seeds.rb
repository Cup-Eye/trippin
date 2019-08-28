[User, Trip, Board, Destination, Accommodation, Transportation, Timeframe].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table.table_name} CASCADE")
end


puts "Creating users...."
User.create!(
  [
    {
      email: "ann@example.com",
      password: "123456"
    },
    {
      email: "bob@example.com",
      password: "123456"
    }
  ]
)

# puts "Updating users..."
# User.first.update()
# User.second.update()

puts "Creating trips..."
Trip.create!(
  {
    user: User.first,
    name: "Bachelor's Party",
    destination: "Spain"
  }
)

puts "Creating destinations..."
trip = Trip.first
board = trip.create_destination_board!({
  title: "Destination",
  status: "incomplete",
  description: "Decide where you wanna go!"
})


board.destinations.create!(
  [
    {
      user: User.first,
      name: "Ibiza"
    },
    {
      user: User.second,
      name: "Barcelona"
    },
  ]
)

board.destinations.sample.update(winning: true)
board.save!

puts "Creating accommodations..."
trip = Trip.first
board = trip.create_accommodation_board!({
  title: "Accommodation",
  status: "incomplete",
  description: "Discover the perfect place to stay!"
  })

board.accommodations.create!(
  [
    {
      user: User.first,
      name: "Ibiza Villa",
      kind: "Private House"
    },
    {
      user: User.second,
      name: "Barcelona Airbnb",
      kind: "Airbnb",
    },
  ]
)

board.accommodations.sample.update(winning: true)
board.save!

puts "Creating timeframes..."
trip = Trip.first
board = trip.create_timeframe_board!({
  title: "Time Frames",
  status: "incomplete",
  description: "Find the most suitable dates!"
})
board.timeframes.create!(
  [
    {
      user: User.first,
      start_date: 8.weeks.from_now,
      end_date: 10.weeks.from_now
    },
    {
      user: User.second,
      start_date: 10.weeks.from_now,
      end_date: 12.weeks.from_now
    },
  ]
)

board.timeframes.sample.update(winning: true)
board.save!


puts "Creating transportations..."
trip = Trip.first
board = trip.create_transportation_board!({
  title: "Transportation",
  status: "incomplete",
  description: "Coordinate your travels!"
})

# You need more fields here!

board.transportations.create!(
  [
    {
      user: User.first,
      kind: "Plane",
      booking_number: "A45666YTZ",
      route_number: "AF1080",
      departure_location: "Paris",
      arrival_location: "Ibiza",
      departure_time: (8.weeks.from_now + 12.hours),
      arrival_time: (8.weeks.from_now + 14.hours)
    }
  ]
)

