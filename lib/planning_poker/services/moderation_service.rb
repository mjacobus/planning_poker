# frozen_string_literal: true
class ModerationService
  CurrentTopicNotSetError = Class.new(DomainError)
  RoundNotCreatedYetError = Class.new(DomainError)

  def initialize(
    room:,
    story_repository: StoryRepository.new,
    round_repository: EstimationRoundRepository.new
  )
    @room = room
    @stories = story_repository
    @rounds = round_repository
  end

  attr_reader :room

  def set_topic_for_estimation(story)
    @stories.set_current(story)
  end

  def current_topic
    @stories.current_room_story(room) || raise(CurrentTopicNotSetError)
  end

  def estimate_current_topic_with(value)
    estimate_story(current_topic, value)
  end

  def estimate_story(story, value)
    @stories.update(
      story.id,
      estimation: value,
      status: Story::STATUS_ESTIMATED
    )
  end

  def start_new_round
    @rounds.create(story_id: current_topic.id)
  end

  def current_round
    @rounds.last_by_story(current_topic) || raise(RoundNotCreatedYetError)
  end
end
