class Story < Hanami::Entity
  STATUS_NOT_ESTIMATED = 'not_estimated'
  STATUS_ESTIMATED = 'estimated'

  attributes do
    attribute :id, Types::Int
    attribute :room_id, Types::Int
    attribute :url, Types::String
    attribute :name, Types::String
    attribute :description, Types::String
    attribute :estimation, Types::String
    attribute :current, Types::Bool
    attribute :status, Types::String.default(STATUS_NOT_ESTIMATED)
    attribute :created_at,  Types::Time
    attribute :updated_at,  Types::Time

    # non database attributes
    attribute :rounds,  Types::Array.default([])
  end

  def estimated?
    status == STATUS_ESTIMATED
  end

  def with_rounds(rounds)
    self.class.new(attributes.merge(rounds: rounds))
  end
end
