class EstimationService
  def initialize(
    rounds_repository: EstimationRoundRepository.new,
    participants_repository: RoundParticipantRepository.new,
    users_repository: UserRepository.new
  )
    @rounds = rounds_repository
    @participants = participants_repository
    @users = users_repository
  end

  def find_story_and_aggregate_by_id(story_id)
    story = @stories.find(story_id) || raise(NotFoundError)
    aggregate_story(story)
  end

  def aggregate_story(story)
    rounds = story_rounds(story)
    story.with_rounds(rounds)
  end

  private

  def story_rounds(story)
    @rounds.story_rounds(story).to_a.map do |round|
      round_with_participants(round)
    end
  end

  def round_with_participants(round)
    participants = round_participants(round).to_a
    round.with_participants(participants)
  end

  def round_participants(round)
    @participants.participants_in_round(round).to_a.map do |participant|
      participant_with_user(participant)
    end
  end

  def participant_with_user(participant)
    user = @users.find(participant.user_id)
    participant.with_user(user)
  end
end
