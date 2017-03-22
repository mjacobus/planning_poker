class EstimationRoomRepository < Hanami::Repository
  def find_by_admin_uuid(admin_uuid)
    estimation_rooms.where(admin_uuid: admin_uuid).limit(1).first
  end
end
