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
              name: "Marcelo",
            },
            estimation: 5
          },
        ]
      },
    ]
  }
}

RSpec.describe EstimationService do
  describe '#aggregate_story aggregates story' do
    let(:service) { subject }
    let(:aggregated) { service.aggregate_story(story) }

    let(:story) { factory.create_story }
    let(:round) { factory.create_round(story_id: story.id) }
    let(:user) { factory.create_user }
    let(:participant) { factory.participants.add_participant(user, round) }

    before do
      factory.clear_all
      story
      round
      user
      participant
    end

    specify 'aggregated is a story' do
      expect(aggregated).to be_a(Story)
      expect(aggregated.id).to eq story.id
      expect(aggregated.name).to eq story.name
      expect(aggregated.description).to eq story.description
      expect(aggregated.created_at).to eq story.created_at
      expect(aggregated.updated_at).to eq story.updated_at
      expect(aggregated.status).to eq story.status
      expect(aggregated.estimation).to eq story.estimation
      expect(aggregated.current).to eq story.current
      expect(aggregated.room_id).to eq story.room_id
      expect(aggregated.id).to eq story.id
    end

    it 'returns #rounds' do
      rounds = aggregated.rounds

      expect(rounds.length).to be 1

      expect(rounds.first).to be_a(EstimationRound)
      expect(rounds.first.id).to eq(round.id)
      expect(rounds.first.story_id).to eq(story.id)
      expect(rounds.first.created_at).to eq(round.created_at)
      expect(rounds.first.status).to eq(round.status)
      expect(rounds.first.updated_at).to eq(round.updated_at)
    end

    it 'has #rounds.first.participants' do
      participants = aggregated.rounds.first.participants
      first = participants.first

      expect(participants.size).to be 1
      expect(participants.first).to eq participant
    end

    it 'has #rounds.first.participants.user' do
      the_user = aggregated.rounds.first.participants.first.user

      expect(the_user).to eq(user)
    end
  end
end
