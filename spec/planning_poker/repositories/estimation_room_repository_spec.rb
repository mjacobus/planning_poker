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
    end

    it 'returns a room with its stories' do
      admin_room = subject.find_by_admin_uuid(room.admin_uuid)

      expect(admin_room).to respond_to(:estimation_stories)
      expect(admin_room.estimation_stories.length).to be(2)
    end
  end
end
