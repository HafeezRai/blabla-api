require 'roar/json'

module RideShowRepresenter
  include Roar::JSON

  property :id
  property :start_city
  property :start_city_lat
  property :start_city_lng
  property :destination_city
  property :destination_city_lat
  property :destination_city_lng
  property :free_places_count
  property :places
  property :places_full
  property :start_date
  property :price
  property :currency
  property :car_id
  property :created_at
  property :updated_at
  property :driver,        extend: UserIndexRepresenter
  property :car,           extend: CarSimpleRepresenter
end
