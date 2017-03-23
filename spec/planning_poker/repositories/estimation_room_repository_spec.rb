RSpec.describe EstimationRoomRepository do
  let(:factory) { TestFactory.new }
  let(:room) { factory.create_room }
  let(:story1) { factory.create_story(room_id: room.id) }
  let(:story2) { factory.create_story(room_id: room.id) }

  describe '#find_by_admin_uuid' do
    before do
      factory.rooms.clear
      factory.stories.clear

      story1
      story2
      factory.create_story(room_id: factory.create_room.id)
    end

    it 'returns a room with its stories' do
      admin_room = subject.find_by_admin_uuid(room.admin_uuid)
      expect(admin_room.admin_uuid).to eq room.admin_uuid

      expect(admin_room).to respond_to(:stories)
      expect(admin_room.stories.count).to be(2)
      expect(admin_room.stories.first).to eq(story1)
    end
  end
end
