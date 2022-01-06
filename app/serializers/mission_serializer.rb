class MissionSerializer
  include JSONAPI::Serializer
  attributes :rescuer_id, :evacuee_id

end
