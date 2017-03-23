RSpec.describe EstimationRoomSerializer do
  let(:attributes) do
    fake_attributes(
      :id,
      :name,
      :description,
      :admin_uuid,
      :voting_uuid,
      :created_at,
      :updated_at
    ).merge(stories: [])
  end

  let(:room) { double(attributes) }

  subject { described_class.new(room) }

  it 'inherits from EntitySerializer' do
    expect(subject).to be_a(EntitySerializer)
  end

  describe '#to_h' do
    it 'hides admin_uuid' do
      expected = EstimationRoomForAdminsSerializer.new(room).to_h
      expected.delete(:admin_uuid)

      expect(subject.to_h).to eq(expected)
    end
  end
end

