# [User, Trip, Board, Destination, Accommodation, Transportation, Timeframe].each do |table|
#   ActiveRecord::Base.connection.execute("TRUNCATE #{table.table_name} CASCADE")
# end

Comment.destroy_all
Participant.destroy_all
Timeframe.destroy_all
Transportation.destroy_all
Accommodation.destroy_all
Destination.destroy_all
Board.destroy_all
Trip.destroy_all
User.destroy_all


puts "Creating users...."
User.create!(
  [
    {
      email: "ann@example.com",
      password: "123456",
      first_name: "Ann",
      last_name: "Smith",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/v1566570154/mz1dxgkq3prjnnainmou.jpg"
    },
    {
      email: "monica@example.com",
      password: "123456",
      first_name: "Monica",
      last_name: "Geller",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/v1566570158/yqrjbhytbilqvfm27oy3.jpg"
    },
    {
      email: "ross@example.com",
      password: "123456",
      first_name: "Ross",
      last_name: "Geller",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/v1566570154/y3uy4ntpemrotqhcjwlf.jpg"
    },
    {
      email: "joey@example.com",
      password: "123456",
      first_name: "Joey",
      last_name: "Tribbiani",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1567495080/jared-sluyter-das6NrjLoM0-unsplash_ngwylp.jpg"
    },
    {
      email: "rachel@example.com",
      password: "123456",
      first_name: "Rachel",
      last_name: "Green",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/v1566570160/jkchsgick9gufqhycn2u.jpg"
    },
    {
      email: "phoebe@example.com",
      password: "123456",
      first_name: "Phoebe",
      last_name: "Buffay",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/v1566570156/vlimetua3o1d9ocvgrfh.jpg"
    },
    {
      email: "chandler@example.com",
      password: "123456",
      first_name: "Chandler",
      last_name: "Bing",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1567495083/ivana-cajina-_7LbC5J-jw4-unsplash_dku2xe.jpg"
    }
  ]
)

# puts "Updating users..."
# User.first.update()
# User.second.update()

puts "Creating trips..."
# Trip.skip_callback(:commit, :after, :create_four_boards)
trip1 = Trip.create!(
  {
    user: User.third,
    name: "Europe Trip"
  }
)

dest_board = trip1.destination_board

Destination.create([
    {
      user: User.fourth,
      name: "Italy",
      board: dest_board,
      winning: true
    },
    {
      user: User.fifth,
      name: "Spain",
      board: dest_board
    },
    {
      user: User.third,
      name: "Greece",
      board: dest_board
    },
    {
      user: User.fourth,
      name: "Portugal",
      board: dest_board
    },
  ])
#Trip.set_callback(:commit, :after, :create_four_boards)

# puts "Creating destinations..."
# trip = Trip.first
# board = trip.create_destination_board!({
#   title: "Destination",
#   status: "incomplete",
#   description: "Decide where you wanna go!"
# })


# board.destinations.create!(
#   [
#     {
#       user: User.first,
#       name: "Ibiza"
#     },
#     {
#       user: User.second,
#       name: "Barcelona"
#     },
#   ]
# )

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
      user: User.fourth,
      name: "Rome Villa",
      kind: "Private House",
      price: 300,
      address: "Via Vittorio Veneto, 70, 00187 Roma RM, Italy"
    },
    {
      user: User.fifth,
      name: "Barcelona Airbnb",
      kind: "Airbnb",
      price: 150,
      address: "Passeig de Gràcia, 92, 08008 Barcelona, Spain"
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
      user: User.third,
      start_date: 8.weeks.from_now,
      end_date: 10.weeks.from_now
    },
    {
      user: User.fifth,
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
      user: User.fourth,
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

