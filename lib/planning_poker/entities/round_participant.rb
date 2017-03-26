class RoundParticipant < Hanami::Entity
  attributes do
    attribute :id, Types::Int
    attribute :user_id, Types::Int
    attribute :estimation_round_id, Types::Int
    attribute :estimation, String
    attribute :created_at,  Types::Time
    attribute :updated_at,  Types::Time
    attribute :user,  Types::Object
  end

  def with_user(user)
    self.class.new(attributes.merge(user: user))
  end
end
