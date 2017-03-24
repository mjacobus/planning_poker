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

  def rounds
    @rounds ||= EstimationRoundRepository.new
  end

  def participants
    @participants ||= RoundParticipantRepository.new
  end

  def users
    @users ||= UserRepository.new
  end

  def create_room(attributes = {})
    attributes = attributes_for_room(attributes)
    rooms.create(attributes)
  end

  def create_story(attributes = {})
    attributes = attributes_for_story(attributes)
    stories.create(attributes)
  end

  def create_round(attributes = {})
    attributes = attributes_for_round(attributes)
    rounds.create(attributes)
  end

  def create_participant(attributes = {})
    attributes = attributes_for_participant(attributes)
    participants.create(attributes)
  end

  def create_user(attributes = {})
    attributes = attributes_for_user(attributes)
    users.create(attributes)
  end

  def fake_attributes(*keys)
    {}.tap do |attr|
      keys.each { |key| attr[key] = "the #{key} #{seq}" }
    end
  end

  def attributes_for_story(attributes = {})
    defaults = { id: seq, room_id: seq, current: false }
    fake = fake_attributes(:name, :description, :url, :status, :estimation)
    fake.merge(defaults).merge(timestamps).merge(attributes)
  end

  def attributes_for_room(attributes = {})
    seq = self.seq

    defaults = {
      id: seq,
      room_id: seq,
      admin_uuid: "admin-uuid-#{seq}",
      voting_uuid: "voting-uuid-#{seq}"
    }.merge(timestamps)

    fake_attributes(:name, :description).merge(defaults).merge(attributes)
  end

  def attributes_for_round(attributes = {})
    seq = self.seq
    defaults = { id: seq, user_id: seq, story_id: seq }
    fake_attributes.merge(defaults).merge(timestamps).merge(attributes)
  end

  def attributes_for_participant(attributes = {})
    { user_id: seq, estimation_round_id: seq }.merge(timestamps).merge(attributes)
  end

  def attributes_for_user(attributes = {})
    fake_attributes(:name).merge(timestamps).merge(attributes)
  end

  def timestamps
    { created_at: Time.now, updated_at: Time.now }
  end

  def reload(entity)
    repo_class = entity.class.to_s + 'Repository'
    repo_class.constantize.new.find(entity.id)
  end

  def clear_all
    [rooms, stories, rounds, participants].map(&:clear)
  end
end
