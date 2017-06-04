require_relative '../../../../../apps/api/controllers/estimation_rooms/stories/create'

RSpec.describe Api::Controllers::EstimationRooms::Stories::Create do
  let(:action) { described_class.new }
  let(:room) { double(id: 'the room id') }
  let(:params) { Hash[estimation_story: story_params, admin_uuid: 'the uuid'] }
  let(:story_params) do
    {
      url: 'the url',
      name: 'the name',
      description: 'the description'
    }
  end

  let(:story) do
    Story.new(factory.attributes_for_story)
  end

  let(:json_response) do
    StorySerializer.new(story, :estimation_story).serialize
  end

  subject do
    allow_any_instance_of(RoomService).to receive(:find_by_admin_uuid)
      .with('the uuid') { room }

    allow_any_instance_of(RoomService).to receive(:append_story_to_room)
      .with(room, story_params) { story }

    action.call(params)
  end

  it 'returns a valid story json' do
    expect(subject).to be_json
    expect(subject).to have_response_status(200)
    expect(subject).to have_json_body(json_response)
  end
end
