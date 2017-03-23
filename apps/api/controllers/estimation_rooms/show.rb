module Api::Controllers::EstimationRooms
  class Show
    include Api::Action

    def call(params)
      admin_uuid = params[:admin_uuid]

      room = RoomService.new.find_by_admin_uuid!(admin_uuid)

      serializer = RoomForAdminsSerializer.new(room, :estimation_room)
      json_response(serializer)
    end
  end
end
