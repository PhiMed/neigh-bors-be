class FarmSerializer
  include JSONAPI::Serializer
  attributes :name, :address, :number_of_animals, :special_needs?, :special_needs_details, :user_id

end
