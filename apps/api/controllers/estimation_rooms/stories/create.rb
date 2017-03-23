module Api::Controllers::EstimationRooms::Stories
  class Create < Api::Controllers::EstimationRooms::AdminRoom
    include Api::Action

    def call(params)
      room = admin_room(params[:admin_uuid])
      room_params = params[:estimation_story]
      story = room_service.append_story_to_room(room, room_params)

      json_response(StorySerializer.new(story, :estimation_story))
    end
  end
end
