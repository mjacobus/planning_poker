module Api::Controllers::EstimationRooms
  class Show
    include Api::Action

    def call(params)
      admin_uuid = params[:admin_uuid]

      room = EstimationRoomService.new.find_by_admin_uuid!(admin_uuid)

      serializer = EstimationRoomForAdminsSerializer.new(room, :estimation_room)
      json_response(serializer)
    end
  end
end
