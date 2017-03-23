RSpec.describe RoomForAdminsSerializer do
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
    it 'returns the attributes' do
      expect(subject.to_h).to eq(attributes)
    end
  end
end
