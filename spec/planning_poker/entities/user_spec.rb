RSpec.describe User do
  it 'has #id' do
    expect(subject).to respond_to(:id)
  end

  it 'has #name' do
    expect(subject).to respond_to(:name)
  end

  it 'has #timestamps' do
    expect(subject).to respond_to(:created_at)
    expect(subject).to respond_to(:updated_at)
  end
end
