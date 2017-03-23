module Api::Controllers::EstimationRooms
  class Create
    include Api::Action

    def call(params)
      room = RoomService.new.create(params[:estimation_room])

      serializer = RoomForAdminsSerializer.new(room, :estimation_room)
      json_response(serializer)
    end
  end
end
