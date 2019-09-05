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


ross = User.create!(
     {
      email: "ross@example.com",
      password: "123456",
      first_name: "Ross",
      last_name: "Geller",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/ar_1:1,b_rgb:262c35,bo_0px_solid_rgb:000000,c_fill,g_auto,r_max,w_1000/v1567606131/Ross2_rld4kh.png"
    })

monica = User.create!(
    {
      email: "monica@example.com",
      password: "123456",
      first_name: "Monica",
      last_name: "Geller",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/ar_1:1,b_rgb:262c35,bo_0px_solid_rgb:000000,c_fill,g_auto,r_max,w_1000/v1567606130/Monica2_skhmqf.png"
    })

joey = User.create!(
    {
      email: "joey@example.com",
      password: "123456",
      first_name: "Joey",
      last_name: "Tribbiani",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/ar_1:1,b_rgb:262c35,bo_0px_solid_rgb:000000,c_fill,g_auto,r_max,w_1000/v1567606129/Joey2_p6aemw.jpg"
    })

rachel = User.create!(
    {
      email: "rachel@example.com",
      password: "123456",
      first_name: "Rachel",
      last_name: "Green",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/ar_1:1,b_rgb:262c35,bo_0px_solid_rgb:000000,c_fill,g_auto,r_max,w_1000/v1567606130/Rachel2_dghzkh.jpg"
    })

phoebe = User.create!(
    {
      email: "phoebe@example.com",
      password: "123456",
      first_name: "Phoebe",
      last_name: "Buffay",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/ar_1:1,b_rgb:262c35,bo_0px_solid_rgb:000000,c_fill,g_auto,r_max,w_1000/v1567606129/Phoebe2_ua1zkg.jpg"
    })

chandler = User.create!(
    {
      email: "chandler@example.com",
      password: "123456",
      first_name: "Chandler",
      last_name: "Bing",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/ar_1:1,b_rgb:262c35,bo_0px_solid_rgb:000000,c_fill,g_auto,r_max,w_1000/v1567606129/Chandler2_j9udlh.jpg"
    })

janine = User.create!(
    {
      email: "janine@example.com",
      password: "123456",
      first_name: "Janine",
      last_name: "LaCroix",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1567690611/Janine2_qcbyqd.jpg"
    })

# puts "Updating users..."
# User.first.update()
# User.second.update()

puts "Creating trips..."
# Trip.skip_callback(:commit, :after, :create_four_boards)
trip1 = Trip.create!(
  {
    user: User.first,
    name: "Wine Trip"
  }
)

dest_board = trip1.destination_board

Destination.create([
    {
      user: rachel,
      name: "Paris",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/v1567691376/Paris_upvvgh.jpg",
      description: 'I was scared, but good scared. I mean like "when I moved to New York" scared.',
      # "Paris is a must see when going to France",
      board: dest_board
    },
    {
      user: monica,
      name: "Nice",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/v1567691376/Nice_xw5dkj.jpg",
      description: "The guys there are super rich and hoooot!!",
      board: dest_board
    },
    {
      user: rachel,
      name: "Bordeaux",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/c_scale,w_2141/v1567691377/Bordeaux_rhawdi.jpg",
      description: "Bordeaux wine is very expensive, bring some cash ;)",
      board: dest_board
    },
    {
      user: phoebe,
      name: "Biarritz",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/v1567691376/Biarritz_kvitrs.jpg",
      description: "Je m'appelle Claude. I just want to go to the beach",
      board: dest_board,
    },
    {
      user: chandler,
      name: "Montpellier",
      remote_photo_url: "https://res.cloudinary.com/mmohn/image/upload/v1567691376/Montpellier_pfboov.jpg",
      description: "It's supposed to be very nice there.",
      board: dest_board
    },
  ])
#Trip.set_callback(:commit, :after, :create_four_boards)

# puts "Creating destinations..."
# trip = Trip.first
# board = trip.create_destination_board!({
#   title: "Destination",
#   status: "In Progress",
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
  status: "In Progress",
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
      user: rachel,
      name: "Little Loft in Paris, Canal",
      kind: "Airbnb",
      url: "https://www.airbnb.de/rooms/2749954?adults=6&source_impression_id=p3_1567609394_0jb%2FCZZDTjn03uj9",
      price: "620€",
      address: "10 Rue de la Grange aux Belles, 75010 Paris, France"
    },
    {
      user: ross,
      name: "Romantic's French Feel Notre Dame",
      url: "https://www.airbnb.de/rooms/2530537?adults=6&source_impression_id=p3_1567609409_sSFsO97wLktUvK8k",
      kind: "Airbnb",
      price: "315€",
      address: "44 Boulevard Saint-Germain, 75005 Paris, France"
    },
    {
      user: monica,
      name: "Apartment Eiffel Signature",
      url: "https://www.airbnb.de/rooms/4461412?adults=6&source_impression_id=p3_1567613790_5822Hv5nHn%2FpzWCk",
      kind: "Airbnb",
      price: "595",
      address: "211 Rue de l'Université, 75007 Paris, France"
    },
     {
      user: phoebe,
      name: "Stylish Haussmann Apartment Centre",
      url: "https://www.airbnb.de/rooms/22714972?adults=6&source_impression_id=p3_1567613803_%2BkVH5WIjvdRItoed",
      kind: "Airbnb",
      price: "418",
      address: "28 Rue de Châteaudun, 75009 Paris, France"
    },
     {
      user: chandler,
      name: "The Residence Luxury Apt Center",
      url: "https://www.airbnb.de/rooms/25155033?adults=6&source_impression_id=p3_1567614654_kUjbT9qWWR%2BRXche&s=zLXes-md",
      kind: "Airbnb",
      price: "589",
      address: "8 Rue de Belzunce, 75010 Paris, France"
    },
     {
      user: ross,
      name: "Central Paris, Beaubourg, 3 bdrms",
      url: "https://www.airbnb.de/rooms/11453841?adults=6&source_impression_id=p3_1567667805_cBqd1CL28w2foD1Y&s=zLXes-md",
      kind: "Airbnb",
      price: "300",
      address: "72 Rue Rambuteau, 75001 Paris, France"
    },
  ]
)

board.accommodations.sample.update(winning: true)
board.save!

puts "Creating timeframes..."
trip = Trip.first
board = trip.create_timeframe_board!({
  title: "Time Frames",
  status: "In Progress",
  description: "Find the most suitable dates!"
})
board.timeframes.create!(
  [
     {
      user: ross,
      start_date: "10-09-2019",
      end_date: "30-09-2019"
    },
    {
      user: monica,
      start_date: "08-09-2019",
      end_date: "11-09-2019"
    },
    {
      user: monica,
      start_date: "13-09-2019",
      end_date: "22-09-2019"
    },
     {
      user: rachel,
      start_date: "08-09-2019",
      end_date: "10-09-2019"
    },
    {
      user: rachel,
      start_date: "13-09-2019",
      end_date: "22-09-2019"
    },
     {
      user: phoebe,
      start_date: "09-09-2019",
      end_date: "24-09-2019"
    },
     {
      user: chandler,
      start_date: "14-09-2019",
      end_date: "26-09-2019"
    },
    # {
    #   user: User.third,
    #   start_date: 1.days.from_now,
    #   end_date: 3.days.from_now
    # },
    # {
    #   user: User.third,
    #   start_date: 5.days.from_now,
    #   end_date: 13.days.from_now
    # },
  ]
)

board.timeframes.sample.update(winning: true)
board.save!


puts "Creating transportations..."
trip = Trip.first
board = trip.create_transportation_board!({
  title: "Transportation",
  status: "In Progress",
  description: "Coordinate your travels!"
})

# You need more fields here!

board.transportations.create!(
  [
    {
      user: ross,
      kind: "Plane",
      booking_number: "F45666YTZ",
      route_number: "FR13N0",
      departure_location: "JFK New York",
      arrival_location: "CDG Paris",
      departure_time: "14-09-2019 8:00:00",
      arrival_time: "14-09-2019 15:30:00"
    },
    {
      user: monica,
      kind: "Plane",
      booking_number: "F9732FRDS",
      route_number: "FR13N0",
      departure_location: "JFK New York",
      arrival_location: "CDG Paris",
      departure_time: "14-09-2019 8:00:00",
      arrival_time: "14-09-2019 15:30:00"
    },
    {
      user: rachel,
      kind: "Plane",
      booking_number: "F7356ZFX",
      route_number: "AF1080",
      departure_location: "LGA New York",
      arrival_location: "ORY Paris-Orly",
      departure_time: "14-09-2019 9:30:00",
      arrival_time: "14-09-2019 16:45:00"
    },
    {
      user: phoebe,
      kind: "Plane",
      booking_number: "F45666YTZ",
      route_number: "AF1080",
      departure_location: "LGA New York",
      arrival_location: "ORY Paris-Orly",
      departure_time: "14-09-2019 9:30:00",
      arrival_time: "14-09-2019 16:45:00"
    },
    {
      user: chandler,
      kind: "Plane",
      booking_number: "F4R5I2N6D",
      route_number: "FR13N0",
      departure_location: "JFK New York",
      arrival_location: "CDG Paris",
      departure_time: "14-09-2019 8:00:00",
      arrival_time: "14-09-2019 15:30:00"
    }
  ]
)

