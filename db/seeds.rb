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
      email: "ross@example.com",
      password: "123456",
      first_name: "Ross",
      last_name: "Geller",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/ar_1:1,b_rgb:262c35,bo_0px_solid_rgb:000000,c_fill,g_auto,r_max,w_1000/v1567606131/Ross2_rld4kh.png"
    },
    {
      email: "monica@example.com",
      password: "123456",
      first_name: "Monica",
      last_name: "Geller",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/ar_1:1,b_rgb:262c35,bo_0px_solid_rgb:000000,c_fill,g_auto,r_max,w_1000/v1567606130/Monica2_skhmqf.png"
    },
    {
      email: "joey@example.com",
      password: "123456",
      first_name: "Joey",
      last_name: "Tribbiani",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/ar_1:1,b_rgb:262c35,bo_0px_solid_rgb:000000,c_fill,g_auto,r_max,w_1000/v1567606129/Joey2_p6aemw.jpg"
    },
    {
      email: "rachel@example.com",
      password: "123456",
      first_name: "Rachel",
      last_name: "Green",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/ar_1:1,b_rgb:262c35,bo_0px_solid_rgb:000000,c_fill,g_auto,r_max,w_1000/v1567606130/Rachel2_dghzkh.jpg"
    },
    {
      email: "phoebe@example.com",
      password: "123456",
      first_name: "Phoebe",
      last_name: "Buffay",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/ar_1:1,b_rgb:262c35,bo_0px_solid_rgb:000000,c_fill,g_auto,r_max,w_1000/v1567606129/Phoebe2_ua1zkg.jpg"
    },
    {
      email: "chandler@example.com",
      password: "123456",
      first_name: "Chandler",
      last_name: "Bing",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/ar_1:1,b_rgb:262c35,bo_0px_solid_rgb:000000,c_fill,g_auto,r_max,w_1000/v1567606129/Chandler2_j9udlh.jpg"
    },
    {
      email: "ann@example.com",
      password: "123456",
      first_name: "Ann",
      last_name: "Smith",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/v1566570154/mz1dxgkq3prjnnainmou.jpg"
    },
  ]
)

# puts "Updating users..."
# User.first.update()
# User.second.update()

puts "Creating trips..."
# Trip.skip_callback(:commit, :after, :create_four_boards)
trip1 = Trip.create!(
  {
    user: User.first,
    name: "France Wine🍷 & Cheese🧀"
  }
)

dest_board = trip1.destination_board

Destination.create([
    {
      user: User.fourth,
      name: "Paris",
      board: dest_board,
      winning: true
    },
    {
      user: User.fifth,
      name: "Nice",
      board: dest_board
    },
    {
      user: User.third,
      name: "Bordeaux",
      board: dest_board
    },
    {
      user: User.second,
      name: "Biaritz",
      board: dest_board,
      winning: true
    },
    {
      user: User.fourth,
      name: "Montpellier",
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
      name: "Little house in Paris, Loft, Canal",
      kind: "Airbnb",
      url: "https://www.airbnb.de/rooms/2749954?adults=6&source_impression_id=p3_1567609394_0jb%2FCZZDTjn03uj9",
      price: "620€",
      address: "10 Rue de la Grange aux Belles, 75010 Paris, France"
    },
    {
      user: User.fifth,
      name: "Paris-Notre Dame ... a Romantic's French Feel",
      url: "https://www.airbnb.de/rooms/2530537?adults=6&source_impression_id=p3_1567609409_sSFsO97wLktUvK8k",
      kind: "Airbnb",
      price: "315€",
      address: "44 Boulevard Saint-Germain, 75005 Paris, France"
    },
    {
      user: User.third,
      name: "[110m2] Eiffel Signature",
      url: "https://www.airbnb.de/rooms/4461412?adults=6&source_impression_id=p3_1567613790_5822Hv5nHn%2FpzWCk",
      kind: "Airbnb",
      price: "595",
      address: "211 Rue de l'Université, 75007 Paris, Frankreich"
    },
     {
      user: User.third,
      name: "Stylish Haussmann Apartment - Paris Centre",
      url: "https://www.airbnb.de/rooms/22714972?adults=6&source_impression_id=p3_1567613803_%2BkVH5WIjvdRItoed",
      kind: "Airbnb",
      price: "418",
      address: "28 Rue de Châteaudun, 75009 Paris, Frankreich"
    },
     {
      user: User.first,
      name: "THE RESIDENCE - LUXURY APARTMENTS PARIS CENTER 1",
      url: "https://www.airbnb.de/rooms/25155033?adults=6&source_impression_id=p3_1567614654_kUjbT9qWWR%2BRXche&s=zLXes-md",
      kind: "Airbnb",
      price: "589",
      address: "8 Rue de Belzunce, 75010 Paris, Frankreich"
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
      start_date: 4.days.from_now,
      end_date: 14.days.from_now
    },
    {
      user: User.second,
      start_date: 1.days.from_now,
      end_date: 2.days.from_now
    },
    {
      user: User.second,
      start_date: 4.days.from_now,
      end_date: 14.days.from_now
    },
    {
      user: User.third,
      start_date: 1.days.from_now,
      end_date: 3.days.from_now
    },
    {
      user: User.third,
      start_date: 5.days.from_now,
      end_date: 13.days.from_now
    },
     {
      user: User.fourth,
      start_date: 1.days.from_now,
      end_date: 2.days.from_now
    },
    {
      user: User.fourth,
      start_date: 4.days.from_now,
      end_date: 14.days.from_now
    },
     {
      user: User.fifth,
      start_date: 3.days.from_now,
      end_date: 13.days.from_now
    },
     {
      user: User.find_by(first_name: "Chandler"),
      start_date: 2.days.from_now,
      end_date: 14.days.from_now
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
      departure_location: "Berlin",
      arrival_location: "Paris",
      departure_time: (8.days.from_now+ 12.hours),
      arrival_time: (8.days.from_now + 14.hours)
    }
  ]
)

