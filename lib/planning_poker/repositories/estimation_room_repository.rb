class EstimationRoomRepository < Hanami::Repository
  def initialize(story_repository: EstimationStoryRepository.new)
    super()
    @stories = story_repository
  end

  def find_by_admin_uuid(admin_uuid)
    estimation_rooms.where(admin_uuid: admin_uuid).one
  end

  protected

  def with_stories(room)
  end
end
