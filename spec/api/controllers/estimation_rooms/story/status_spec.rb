require_relative '../../../../../apps/api/controllers/estimation_rooms/story/status'

RSpec.describe Api::Controllers::EstimationRooms::Story::Status do
  before do
    factory.stories.clear
    factory.rooms.clear
  end

  let(:story) { factory.create_story(room_id: room.id) }
  let(:room) { factory.create_room }
  let(:action) { described_class.new }
  let(:params) { Hash[uuid: room.voting_uuid, id: story.id] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
