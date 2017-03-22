RSpec.describe EstimationRoomService do
  let(:description) { 'the description' }
  let(:name) { 'the name' }

  let(:example_room) do
    repository.create(admin_uuid: 'the admin uid')
  end

  let(:repository) { EstimationRoomRepository.new }
  let(:stories_repository) { EstimationStoryRepository.new }

  before(:each) do
    repository.clear
  end

  describe '#create' do
    context 'on a successful create' do
      subject do
        EstimationRoomService.new.create(name: name, description: description)
      end

      before { subject }

      it 'it will create a new record in the database' do
        expect(repository.all.count).to eq(1)
      end

      it 'will return the entity' do
        expect(subject).to eq(repository.last)
      end

      it 'will set a unique admin_uuid' do
        expect(subject.admin_uuid).not_to be_nil
        expect(subject.admin_uuid.length).to eq(36)
      end

      it 'will set a unique voting_uuid' do
        expect(subject.voting_uuid).not_to be_nil
        expect(subject.voting_uuid.length).to eq(36)
      end
    end

    context 'with invalid data' do
      subject do
        EstimationRoomService.new.create(name: '', description: description)
      end

      it 'throws validatione exception' do
        expect do
          subject
        end.to raise_error(ValidationError, 'Invalid name')
      end
    end
  end

  describe '#find_by_admin_uuid!' do
    it 'finds story when exists' do
      example_room

      expect(subject.find_by_admin_uuid!(example_room.admin_uuid)).to eq(example_room)
    end

    it 'raises an exception when record cannot be found'
  end

  describe '#append_story_to_room' do
    describe 'when the attributes are correct' do
      let(:attributes) do
        fake_attributes(
          :url,
          :name,
          :description,
          :estimation,
          :status
        )
      end

      before do
        stories_repository.clear

        subject
      end

      subject do
        described_class.new.append_story_to_room(example_room, attributes)
      end

      it 'creates a new story' do
        expect(stories_repository.all.length).to eq(1)
      end

      specify 'new story has room id' do
        expect(subject.room_id).to be(example_room.id)
      end

      specify 'new story has correct attributes' do
        expect(subject.url).to eq('the url')
        expect(subject.name).to eq('the name')
        expect(subject.description).to eq('the description')
        expect(subject.estimation).to eq('the estimation')
        expect(subject.status).to eq('the status')
      end
    end

    context 'with invalid data' do
      subject do
        EstimationRoomService.new.append_story_to_room(example_room, {})
      end

      it 'throws validatione exception' do
        expect do
          subject
        end.to raise_error(ValidationError, 'Invalid name')
      end
    end
  end
end
