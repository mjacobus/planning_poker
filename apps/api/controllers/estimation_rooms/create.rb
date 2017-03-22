module Api::Controllers::EstimationRooms
  class Create
    include Api::Action

    # params do
    #   required(:estimation_room) do
    #     required(:name)
    #     optional(:description)
    #   end
    # end

    def call(params)
      room = EstimationRoomService.new.create(params[:estimation_room])

      json_response(id: room.id,
                    name: room.name,
                    description: room.description,
                    admin_uuid: room.admin_uuid,
                    voting_uuid: room.voting_uuid,
                    created_at: room.created_at,
                    updated_at: room.updated_at)
    end
  end
end
