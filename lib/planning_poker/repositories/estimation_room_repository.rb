class EstimationRoomRepository < Hanami::Repository
  associations do
    has_many :estimation_stories, foreign_key: :room_id
  end

  def find_by_admin_uuid(admin_uuid)
    with_stories.where(admin_uuid: admin_uuid).limit(1).first
  end

  protected

  def with_stories
    aggregate(:estimation_stories)
  end
end
