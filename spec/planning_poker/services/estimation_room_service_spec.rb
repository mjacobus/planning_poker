RSpec.describe EstimationRoomService do
  let(:description) { 'the description' }
  let(:name) { 'the name' }

  let(:repository) { EstimationRoomRepository.new }

  before(:each) { repository.clear }

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
end
