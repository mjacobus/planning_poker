RSpec.describe EntitySerializer do
  let(:described_class) do
    Class.new(EntitySerializer) do
      protected

      def to_h
        { id: 'the id', name: 'the name' }
      end
    end
  end

  let(:attributes) { fake_attributes(:id, :name) }
  let(:entity) { double(attributes) }

  subject { described_class.new(entity) }

  describe '#serialize' do
    describe 'with no parent key' do
      subject { described_class.new(entity) }

      it 'serializes without parent key' do
        expect(parse_json(subject.serialize)).to eq(attributes)
      end
    end
  end

  describe '#serialize' do
    describe 'with no parent key' do
      subject { described_class.new(entity, :entity) }

      it 'serializes without parent key' do
        expected = {
          entity: attributes
        }

        expect(parse_json(subject.serialize)).to eq(expected)
      end
    end
  end
end
