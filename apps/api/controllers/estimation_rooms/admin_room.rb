module Api::Controllers::EstimationRooms
  class AdminRoom
    protected

    def admin_room(admin_uuid)
      RoomService.new.find_by_admin_uuid!(admin_uuid)
    end

    def room_service
      @room_service ||= RoomService.new
    end
  end
end
