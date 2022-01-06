class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :phone, :is_available_for_missions?,
             :rescuer_trailer_capacity
end
