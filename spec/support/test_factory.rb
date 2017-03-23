class TestFactory
  def initialize
    @seq = 0
  end

  def seq
    @seq = @seq+1
  end

  def rooms
    @rooms ||= EstimationRoomRepository.new
  end

  def stories
    @stories ||= EstimationStoryRepository.new
  end

  def create_room(attributes = {})
    attributes = fake_attributes(
      :name,
      :description,
      :admin_uuid,
      :voting_uuid,
    ).merge(attributes)

    rooms.create(attributes)
  end

  def create_story(attributes = {})
    attributes = fake_attributes(
      :name,
      :description,
      :url,
    ).merge(attributes)

    stories.create(attributes)
  end

  def fake_attributes(*attributes)
    seq = self.seq

    {}.tap do |hash|
      attributes.each do |attribute|
        hash[attribute] = "#{attribute} #{seq}"
      end
    end
  end
end
