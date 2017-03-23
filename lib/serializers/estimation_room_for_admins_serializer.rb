class EstimationRoomForAdminsSerializer < EntitySerializer
  def to_h
    {
      id: object.id,
      name: object.name,
      description: object.description,
      admin_uuid: object.admin_uuid,
      voting_uuid: object.voting_uuid,
      created_at: object.created_at,
      updated_at: object.updated_at,
      stories: stories_to_h(object.stories)
    }
  end

  protected

  def stories_to_h(stories)
    [].tap do |array|
      stories.each do |story|
        array << EstimationStorySerializer.new(story).to_h
      end
    end
  end
end
