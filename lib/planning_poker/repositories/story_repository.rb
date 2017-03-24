class StoryRepository < Hanami::Repository
  def belonging_to_room(room)
    stories.where(room_id: room.id)
  end

  def set_current(story)
    stories.where(room_id: story.room_id).update(current: false)
    update(story.id, current: true)
  end

  def current_room_story(room)
    stories.where(room_id: room.id).one
  end
end
