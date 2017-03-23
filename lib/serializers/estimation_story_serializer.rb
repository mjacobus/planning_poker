class EstimationStorySerializer < EntitySerializer
  def to_h
    {
      id: object.id,
      name: object.name,
      description: object.description,
      created_at: object.created_at,
      updated_at: object.updated_at,
      room_id: object.room_id,
    }
  end
end
