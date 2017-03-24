class StorySerializer < EntitySerializer
  def to_h
    {
      id: object.id,
      name: object.name,
      description: object.description,
      estimation: object.estimation,
      url: object.url,
      current: object.current,
      status: object.status,
      created_at: object.created_at,
      updated_at: object.updated_at,
      room_id: object.room_id,
    }
  end
end
