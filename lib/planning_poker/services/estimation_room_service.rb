class EstimationRoomService
  def initialize(
    estimation_repository: EstimationRoomRepository.new,
    stories_repository: EstimationStoryRepository.new
  )
    @rooms = estimation_repository
    @stories = stories_repository
  end

  def create(attributes = {})
    RoomCreationValidator.new.validate!(attributes)

    attributes = attributes.merge(
      voting_uuid: UniqueId.new.to_s,
      admin_uuid: UniqueId.new.to_s
    )

    @rooms.create(attributes)
  end

  def find_by_admin_uuid!(admin_uuid)
    @rooms.find_by_admin_uuid(admin_uuid)
  end

  def append_story_to_room(room, story_attributes = {})
    StoryCreationValidator.new.validate!(story_attributes)

    story_attributes = story_attributes.merge(
      room_id: room.id
    )

    stories.create(story_attributes)
  end

  protected

  attr_reader :rooms
  attr_reader :stories
end
