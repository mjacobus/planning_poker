module Api::Controllers::EstimationRooms
  class Show < AdminRoom
    include Api::Action

    def call(params)
      room = admin_room(params[:admin_uuid])
      serializer = RoomForAdminsSerializer.new(room, :estimation_room)
      json_response(serializer)
    end
  end
end
