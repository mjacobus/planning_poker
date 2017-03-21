class EstimationRoom < Hanami::Entity
  attributes do
    attribute :id,          Types::Int
    attribute :name,        Types::String
    attribute :description, Types::String
    attribute :admin_uuid,  Types::String
    attribute :voting_uuid, Types::String
    attribute :created_at,  Types::Time
    attribute :updated_at,  Types::Time
  end
end
