class EstimationStoryRepository < Hanami::Repository
  def belonging_to_room(room)
    estimation_stories.where(room_id: room.id)
  end
end
