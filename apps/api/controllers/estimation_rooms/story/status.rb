module Api::Controllers::EstimationRooms::Story
  class Status
    include Api::Action

    # TODO: not tested
    def call(params)
      RoomService.new.find_by_uuid(params[:uuid]) || fail(DomainError, 'room not found')
      story = EstimationService.new.find_story_and_aggregate_by_id(params[:id])
      serializer = StoryStatusSerializer.new(story, :story)
      json_response(serializer)
    end
  end
end
