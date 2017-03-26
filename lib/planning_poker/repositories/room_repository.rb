class RoomRepository < Hanami::Repository
  def initialize(story_repository: StoryRepository.new)
    super()
    @stories = story_repository
  end

  def find_by_admin_uuid(uuid)
    room = rooms.where(admin_uuid: uuid).one

    with_stories(room)
  end

  def find_by_admin_uuid(uuid)
    rooms.where(voting_uuid: uuid).limit(1).first
  end

  protected

  def with_stories(room)
    stories = @stories.belonging_to_room(room)
    room.with_stories(stories)
  end
end
