RSpec.describe RoundParticipant do
  it 'has #user' do
    user = User.new(factory.attributes_for_user)

    participant = subject.with_user(user)

    expect(participant.user).to eq(user)
    expect(participant.user.name).to eq(user.name)
    expect(participant.user.class).to be(User)
  end
end
