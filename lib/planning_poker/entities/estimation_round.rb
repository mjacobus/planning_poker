class EstimationRound < Hanami::Entity
  STATUS_ONGOING = 'ongoing'
  STATUS_FINISHED = 'finished'
  STATUS_CANCELED = 'canceled'

  attributes do
    attribute :id, Types::Int
    attribute :story_id, Types::Int

    # TODO: necessary?
    attribute :sequence, Types::Int

    attribute :status, Types::String.default(STATUS_ONGOING)
    attribute :created_at,  Types::Time
    attribute :updated_at,  Types::Time
    attribute :participants,  Types::Array.default([])
  end

  def ongoing?
    status == STATUS_ONGOING
  end

  def with_participants(participants)
    self.class.new(attributes.merge(participants: participants))
  end
end
