class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :user_type, :email, :phone, :address,
             :number_of_animals, :special_needs?,
             :special_needs_details, :trailer_capacity,
             :available?
end
