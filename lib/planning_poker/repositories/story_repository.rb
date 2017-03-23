class StoryRepository < Hanami::Repository
  def belonging_to_room(room)
    stories.where(room_id: room.id)
  end
end
