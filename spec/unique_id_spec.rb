RSpec.describe UniqueId do
  describe 'when no id is given in the constructor' do
    it 'creates a new unique id' do
      allow(SecureRandom).to receive(:uuid) { 'foobar' }

      expect(UniqueId.new.to_s).to eq('foobar')
    end
  end

  describe 'when id is passed in the constructor' do
    it 'uses that value as unique id' do
      string = UniqueId.new('foo').to_s

      expect(string).to eq('foo')
    end
  end

  describe '===' do
    it 'returns true when values are the same' do
      expect(UniqueId.new('foo')).to eq(UniqueId.new('foo'))
    end

    it 'returns false when values are different' do
      expect(UniqueId.new('foo')).not_to eq(UniqueId.new('bar'))
    end
  end
end
