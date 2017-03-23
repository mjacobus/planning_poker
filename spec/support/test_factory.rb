# frozen_string_literal: true
class TestFactory
  def initialize
    @seq = 0
  end

  def seq
    @seq += 1
  end

  def rooms
    @rooms ||= RoomRepository.new
  end

  def stories
    @stories ||= StoryRepository.new
  end

  def create_room(attributes = {})
    attributes = fake_attributes(
      :name,
      :description,
      :admin_uuid,
      :voting_uuid
    ).merge(attributes)

    rooms.create(attributes)
  end

  def create_story(attributes = {})
    attributes = fake_attributes(
      :name,
      :description,
      :url
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

  def attributes_for_story(attributes = {})
    fake_attributes(
      :name,
      :description,
      :url,
      :status,
      :estimation,
    ).merge(id: seq,
           room_id: seq,
           created_at: Time.now,
           updated_at: Time.now).merge(attributes)
  end
end
