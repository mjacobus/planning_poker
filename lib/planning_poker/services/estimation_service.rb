class EstimationService
  def initialize(rounds_repository: EstimationRoundRepository.new)
    @rounds = rounds_repository
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
    round
  end
end
