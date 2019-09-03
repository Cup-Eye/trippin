module AccommodationsHelper
  def marker(accommodation)
    [{
      lat: accommodation.latitude,
      lng: accommodation.longitude
    }]
  end
end
