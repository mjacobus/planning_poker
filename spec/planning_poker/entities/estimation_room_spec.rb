RSpec.describe EstimationRoom do
  subject { EstimationRoom.new }

  %w(
    id
    name
    description
    admin_uuid
    voting_uuid
    created_at
    updated_at
  ).each do |attribute|
    it "has getter for #{attribute}" do
      expect(subject).to respond_to(attribute)
    end
  end

  describe '#stories' do
    it "defaults to empty array" do
      expect(subject.stories).to eq([])
    end

    it 'can be mutted on the consturctor' do
      stories = ['foo']

      subject = EstimationRoom.new(stories: stories)

      expect(subject.stories).to be(stories)
    end
  end
end
