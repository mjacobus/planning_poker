# frozen_string_literal: true
class EstimationRoundService
  NotParticipatingError = Class.new(DomainError)

  def initialize(
    round:,
    user:,
    participant_repository: RoundParticipantRepository.new
  )
    @round = round
    @user = user
    @participants = participant_repository
  end

  def join
    @participants.add_participant(@user, @round) unless participating?
  end

  def leave
    @participants.remove(@user, @round)
  end

  def estimation
    @participants.find_by_user_and_round(@user, @round).estimation
  end

  def estimate(value)
    raise(NotParticipatingError) unless participating?
    @participants.assign_user_estimation(value, @user, @round)
  end

  def revoke_estimation
    estimate(nil)
  end

  def round_participants
    @participants.participants_in_round(@round)
  end

  def participating?
    round_participants.to_a.map(&:user_id).include?(@user.id)
  end
end
