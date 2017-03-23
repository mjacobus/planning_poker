require_relative '../../../../apps/api/controllers/estimation_rooms/show'

RSpec.describe Api::Controllers::EstimationRooms::Show do
  let(:factory) { TestFactory.new }
  let(:action) { described_class.new }
  let(:params) { Hash[admin_uuid: 'the_admin_uuid'] }
  let(:room) { factory.create_room(admin_uuid: 'the_admin_uuid') }
  let(:json_body) { { foo: :bar }.to_json }

  before do
    factory.rooms.clear
  end

  describe 'on a successful request' do
    before do
      room
      stub_serializer(EstimationRoomForAdminsSerializer, room, :estimation_room) do
        json_body
      end
    end

    subject { action.call(params) }

    it 'responds with json' do
      expect(subject).to be_json
    end

    it 'responds with correct json' do
      expect(subject).to have_json_body(json_body)
    end
  end
end
