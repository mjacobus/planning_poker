class RoomSerializer < RoomForAdminsSerializer
  def to_h
    hash = super
    hash.delete(:admin_uuid)
    hash
  end
end
