require_relative '../../../../../apps/api/controllers/estimation_rooms/story/status'

RSpec.describe Api::Controllers::EstimationRooms::Story::Status do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
