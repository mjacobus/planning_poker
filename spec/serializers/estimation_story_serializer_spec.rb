RSpec.describe EstimationStorySerializer do
  let(:factory) { TestFactory.new }
  let(:story) { EstimationStory.new(attributes) }
  let(:attributes) { factory.attributes_for_story }

  subject { described_class.new(story) }

  it 'inherits from EntitySerializer' do
    expect(subject).to be_a(EntitySerializer)
  end

  specify '#to_h works returns a correct hash' do
    expect(subject.to_h).to eq(attributes)
  end
end
