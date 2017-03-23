require_relative '../../../../apps/api/controllers/estimation_rooms/create'

RSpec.describe Api::Controllers::EstimationRooms::Create do
  let(:action) { described_class.new }
  let(:payload) { { name: 'some name', description: 'some description' } }
  let(:params) { { estimation_room: payload } }
  let(:room_attributes) do
    {
      id:           'some id',
      name:         'some name',
      description:  'some desc',
      admin_uuid:   'some uudi',
      voting_uuid:  'some uudi2',
      created_at:   'some created at',
      updated_at:   'some updated at',
      stories: []
    }
  end

  # let(:room) { double(room_attributes) }
  let(:room) { Room.new(room_attributes) }
  let(:room) { Room.new(room_attributes) }

  subject { action.call(params) }

  describe 'on a valid request' do
    before do
      allow_any_instance_of(RoomService).to receive(:create)
        .with(payload).and_return(room)

      subject
    end

    it 'responds with success json' do
      expect(subject).to have_response_status(200)
      expect(subject).to have_json_body(estimation_room: room_attributes)
      expect(subject).to be_json
    end
  end
end
