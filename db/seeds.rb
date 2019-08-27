puts "Destroying boards..."
Board.destroy_all

puts "Destroying trips..."
Trip.destroy_all

puts "Destroying users and their destinations, timeframes, accommodations, transportations..."
User.destroy_all

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
    name: "Bachelor's Party",
    destination: "Spain"
  }
)

puts "Creating destinations..."
trip = Trip.first
board = trip.create_destination_board!
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

board.winning_destination = board.destinations.sample
board.save!

puts "Creating accommodations..."
trip = Trip.first
board = trip.create_accommodation_board!
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

board.winning_accommodation = board.accommodations.sample
board.save!

puts "Creating timeframes..."
trip = Trip.first
board = trip.create_timeframe_board!
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

board.winning_timeframe = board.timeframes.sample
board.save!


      # t.string :route_number
      # t.string :booking_number
      # t.references :user, foreign_key: true
      # t.datetime :departure_time
      # t.datetime :arrival_time
      # t.string :departure_location
      # t.string :arrival_location
      # t.string :kind

puts "Creating transportations..."
trip = Trip.first
board = trip.create_transportation_board!

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

