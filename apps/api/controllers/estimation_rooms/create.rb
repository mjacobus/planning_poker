module Api::Controllers::EstimationRooms
  class Create
    include Api::Action

    def call(params)
      room = EstimationRoomService.new.create(params[:estimation_room])

      serializer = EstimationRoomForAdminsSerializer.new(room, :estimation_room)
      json_response(serializer)
    end
  end
end
