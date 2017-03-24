# frozen_string_literal: true
class RoundParticipantRepository < Hanami::Repository
  def participants_in_round(round)
    round_participants.where(estimation_round_id: round.id)
  end

  def add_participant(user, round)
    create(user_id: user.id, estimation_round_id: round.id)
  end

  def remove(user, round)
    params = { user_id: user.id, estimation_round_id: round.id }
    round_participants.where(params).delete
  end

  def assign_user_estimation(value, user, round)
    participants_in_round(round).where(user_id: user.id).update(estimation: value)
  end

  def find_by_user_and_round(user, round)
    participants_in_round(round).where(user_id: user.id).first
  end
end
