class MissionSerializer
  include JSONAPI::Serializer
  attributes :user_id, :farm_id
end
