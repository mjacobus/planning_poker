class EstimationRoomForAdminsSerializer < EntitySerializer
  def to_h
    {
      id: object.id,
      name: object.name,
      description: object.description,
      admin_uuid: object.admin_uuid,
      voting_uuid: object.voting_uuid,
      created_at: object.created_at,
      updated_at: object.updated_at
    }
  end
end
