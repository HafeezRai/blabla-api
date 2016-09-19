module API
  module ParamsHelper
    extend Grape::API::Helpers

    params :pagination_params do |options = {}|
      optional :page, type: Integer, default: options.fetch(:page_default, 1),
        desc: 'Page number of search results'
      optional :per, type: Integer, default: options.fetch(:per_default, 25),
        desc: 'Number of records per page for search results'
    end

    params :user_params do |options = {}|
      requires :first_name, type: String, desc: "user first_name"
      requires :last_name, type: String, desc: "user last_name"
      requires :email, type: String, desc: "user email"
      optional :gender, type: String, desc: "user gender"
      optional :tel_num, type: String, desc: "user telephone number"
      optional :date_of_birth, type: Date, desc: "user birth year"
      optional :avatar, type: Hash do
        optional :filename, type: String
        optional :type, type: String
        optional :name, type: String
        optional :tempfile
        optional :head, type: String
      end
    end

    params :car_params do |options = {}|
      requires :brand, type: String, desc: "car brand"
      requires :model, type: String, desc: "car model"
      requires :comfort, type: String, desc: "car comfort"
      requires :places, type: String, desc: "car places"
      requires :color, type: String, desc: "car color"
      requires :category, type: String, desc: "car category"
      requires :production_year, type: String, desc: "car production year"
      optional :car_photo, type: Hash do
        optional :filename, type: String
        optional :type, type: String
        optional :name, type: String
        optional :tempfile
        optional :head, type: String
      end
    end

    params :ride_params do |options = {}|
      requires :start_city, type: String, desc: "user start_city"
      optional :start_city_lat, type: String, desc: "user start_city_lat"
      optional :start_city_lng, type: String, desc: "user start_city_lng"
      requires :destination_city, type: String, desc: "user destination_city"
      optional :destination_city_lat, type: String, desc: "user destination_city_lat"
      optional :destination_city_lng, type: String, desc: "user destination_city_lng"
      requires :places, type: Integer, desc: "user places"
      requires :start_date, type: String, desc: "user start_date"
      requires :price, type: String, desc: "user price"
      requires :currency, type: String, desc: "user currency"
      requires :car_id, type: Integer, desc: "user car_id"
    end
  end
end