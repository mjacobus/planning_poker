# frozen_string_literal: true
class StoryStatusSerializer < EntitySerializer
  def to_h
    {
      id: object.id,
      name: object.name,
      description: object.description,
      estimation: object.estimation,
      url: object.url,
      current: object.current,
      status: object.status,
      created_at: object.created_at,
      updated_at: object.updated_at,
      room_id: object.room_id
    }.merge(estimation_rounds: rounds_to_hash)
  end

  private

  def rounds_to_hash
    object.rounds.map { |round| round_to_hash(round) }
  end

  def round_to_hash(round)
    {
      id: round.id,
      participants: round.participants.map { |p| participant_to_hash(p) }
    }
  end

  def participant_to_hash(participant)
    {
      id: participant.id,
      estimation: participant.estimation,
      user: { id: participant.user.id, name: participant.user.name }
    }
  end
end
