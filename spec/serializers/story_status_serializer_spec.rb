RSpec.describe StoryStatusSerializer do
  let(:story) { Story.new(story_attributes).with_rounds([round]) }
  let(:round) do
    EstimationRound.new(factory.attributes_for_round)
                   .with_participants([participant])
  end

  let(:participant) do
    RoundParticipant.new(user_id: user.id, estimation: 'five', user: user)
  end

  let(:user) { User.new(factory.attributes_for_user) }
  let(:story_attributes) { factory.attributes_for_story }

  subject { described_class.new(story) }

  let(:hash) { subject.to_h }

  it 'inherits from EntitySerializer' do
    expect(subject).to be_a(EntitySerializer)
  end

  specify '#to_h works returns a correct hash' do
    round_to_hash = {
      id: round.id,
      participants: [
        id: participant.id,
        user: {
          id: user.id,
          name: user.name
        },
        estimation: 'five'
      ]
    }

    expected_attributes = story_attributes.merge(
      estimation_rounds: [round_to_hash]
    )

    expect(hash).to eq(expected_attributes)
  end
end

{
  story: {
    id: 1,
    status: 'estimated',
    estimated: true,
    current: true,
    estimation: 'story estimation',
    name: 'name',
    description: 'description',
    url: 'url',
    estimation_rounds: [
      {
        id: 1,
        participants: [
          {
            user: {
              id: 1,
              name: 'Marcelo'
            },
            estimation: 5
          }
        ]
      }
    ]
  }
}
