RSpec.describe UserService do
  let(:repository) { UserRepository.new }

  before(:each) do
    repository.clear
  end

  describe "#create_by_name" do
    context 'with valid params' do
      let(:name) { 'the name' }
      subject { UserService.new.create_by_name(name) }

      it 'creates a new user' do
        subject

        expect(repository.all.count).to eq(1)
      end

      it 'returns the created user' do
        created = subject

        expect(created).to be_a(User)
        expect(created.name).to eq(name)
      end
    end

    context 'with invalid params' do
      it 'raises error with empty name' do
        expect do
          subject.create_by_name('')
        end.to raise_error(Validator::ValidationError, 'Name cannot be empty')
      end

      it 'raises error with nil name' do
        expect do
          subject.create_by_name(nil)
        end.to raise_error(Validator::ValidationError, 'Name cannot be empty')
      end
    end
  end

  describe '#find_by_id' do
    let(:user) { repository.create(name: 'foo') }

    describe 'when user exists' do
      it 'returns a user by the given id' do
        found = subject.find_by_id(user.id)

        expect(found).to eq(user)
      end
    end

    describe 'when user does not exist' do
      it 'throws an exception' do
        expect do
          subject.find_by_id(-1)
        end.to raise_error(UserService::UserNotFound)
      end
    end
  end
end
