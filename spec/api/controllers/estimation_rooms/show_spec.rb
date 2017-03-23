require_relative '../../../../apps/api/controllers/estimation_rooms/show'

RSpec.describe Api::Controllers::EstimationRooms::Show do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
