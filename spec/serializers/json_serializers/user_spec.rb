RSpec.describe UserSerializer do
  let(:attributes) { fake_attributes(:id, :name) }
  let(:user) { double(attributes) }

  subject { described_class.new(user) }

  it 'extends EntitySerializer' do
    expect(subject).to be_a(EntitySerializer)
  end

  describe '#serialize' do
    describe 'with no parent key' do
      subject { described_class.new(user) }

      it 'serializes without parent key' do
        expect(parse_json(subject.serialize)).to eq(attributes)
      end
    end
  end

  describe '#serialize' do
    describe 'with no parent key' do
      subject { described_class.new(user, :user) }

      it 'serializes without parent key' do
        expected = {
          user: attributes
        }

        expect(parse_json(subject.serialize)).to eq(expected)
      end
    end
  end
end
