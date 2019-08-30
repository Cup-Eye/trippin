[User, Trip, Board, Destination, Accommodation, Transportation, Timeframe].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table.table_name} CASCADE")
end


puts "Creating users...."
User.create!(
  [
    {
      email: "ann@example.com",
      password: "123456",
      first_name: "Ann",
      last_name: "Smith"
    },
    {
      email: "bob@example.com",
      password: "123456",
      first_name: "Bob",
      last_name: "Andrews"
    },
    {
      email: "peter@example.com",
      password: "123456",
      first_name: "Peter",
      last_name: "Shaw"
    },
    {
      email: "justus@example.com",
      password: "123456",
      first_name: "Justus",
      last_name: "Jonas"
    },
    {
      email: "monica@example.com",
      password: "123456",
      first_name: "Monica",
      last_name: "Geller"
    },
    {
      email: "ross@example.com",
      password: "123456",
      first_name: "Ross",
      last_name: "Geller"
    },
    {
      email: "joey@example.com",
      password: "123456",
      first_name: "Joey",
      last_name: "Tribbiani"
    },
    {
      email: "rachel@example.com",
      password: "123456",
      first_name: "Rachel",
      last_name: "Green"
    },
    {
      email: "phoebe@example.com",
      password: "123456",
      first_name: "Phoebe",
      last_name: "Buffay"
    },
    {
      email: "chandler@example.com",
      password: "123456",
      first_name: "Chandler",
      last_name: "Bing"
    }
  ]
)

# puts "Updating users..."
# User.first.update()
# User.second.update()

puts "Creating trips..."
Trip.skip_callback(:commit, :after, :create_four_boards)
Trip.create!(
  {
    user: User.first,
    name: "Bachelor's Party",
    destination: "Spain"
  }
)
Trip.set_callback(:commit, :after, :create_four_boards)

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

  # validates :name, presence: true, length: { maximum: 50 }
  # validates :url, presence: true, uniqueness: true
  # validates :address, presence: true, length: { maximum: 100 }
  # validates :price, presence: true, length: { maximum: 10 }
  # validates :kind, presence: true

board.accommodations.create!(
  [
    {
      user: User.first,
      name: "Ibiza Villa",
      kind: "Private House",
      price: 300
    },
    {
      user: User.second,
      name: "Barcelona Airbnb",
      kind: "Airbnb",
      price: 150
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

