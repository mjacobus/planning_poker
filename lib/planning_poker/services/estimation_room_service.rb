class EstimationRoomService
  def initialize(estimation_repository: EstimationRoomRepository.new)
    @repository = estimation_repository
  end

  def create(args = {})
    RoomCreationValidator.new.validate!(args)

    args = args.merge(
      voting_uuid: UniqueId.new.to_s,
      admin_uuid: UniqueId.new.to_s
    )

    @repository.create(args)
  end
end
