module Api::Controllers::EstimationRooms::Stories
  class Create
    include Api::Action

    def call(params)
      admin_uuid = params[:admin_uuid]
      room_params = params[:estimation_story]
      room = room_service.find_by_admin_uuid!(admin_uuid)
      story = room_service.append_story_to_room(room, room_params)
      json_response(to_json(story))
    end

    protected

    def room_service
      @room_service ||= EstimationRoomService.new
    end

    def to_json(story)
      {
        estimation_story: {
          id: story.id,
          room_id: story.room_id,
          url: story.url,
          name: story.name,
          description: story.description,
          final_estimation: story.final_estimation,
          rounds: []
        }
      }
    end
  end
end
