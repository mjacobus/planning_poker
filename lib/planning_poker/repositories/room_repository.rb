class RoomRepository < Hanami::Repository
  def initialize(story_repository: StoryRepository.new)
    super()
    @stories = story_repository
  end

  def find_by_admin_uuid(uuid)
    room = rooms.where(admin_uuid: uuid).limit(1).first
    fail(NotFoundError, "cannot find by id #{uuid}") unless room
    with_stories(room)
  end

  def find_by_voting_uuid(uuid)
    room = rooms.where(voting_uuid: uuid).limit(1).first
    fail(NotFoundError, "cannot find by id #{uuid}") unless room
    with_stories(room)
  end

  protected

  def with_stories(room)
    stories = @stories.belonging_to_room(room)
    room.with_stories(stories)
  end
end
