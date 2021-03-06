# frozen_string_literal: true

class CarSerializer < ActiveModel::Serializer
  attributes :id, :brand, :model, :full_name, :owner_full_name, :production_year, :comfort,
             :comfort_stars, :places, :places_full, :color, :comfort,
             :category, :created_at, :owner_id, :car_photo

  has_one :user, serializer: UserSerializer

  def car_photo
    object.photo_mini_url
  end

  def owner_id
    object.user_id
  end

  def owner_full_name
    object.user.full_name
  end

  def places_full
    object.places.to_s + " " + "place".pluralize(object.places)
  end
end
