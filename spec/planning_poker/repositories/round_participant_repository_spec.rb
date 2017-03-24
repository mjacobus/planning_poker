# frozen_string_literal: true
RSpec.describe RoundParticipantRepository do
  before do
    factory.clear_all
  end

  let(:story) { factory.create_story }
  let(:round) { factory.create_round(story_id: story.id) }
  let(:user1) { factory.create_user }
  let(:user2) { factory.create_user }

  subject { RoundParticipantRepository.new }

  describe '#participants_in_round' do
    it 'returns empty array when empty' do
      participants = subject.participants_in_round(round)

      expect(participants.to_a).to eq([])
    end

    it 'returns the round participants, when there is any' do
      # unwanted
      factory.create_participant

      participant1 = factory.create_participant(
        estimation_round_id: round.id,
        user_id: user1.id
      )

      participant2 = factory.create_participant(
        estimation_round_id: round.id,
        user_id: user2.id
      )

      participants = subject.participants_in_round(round).to_a

      expect(participants).to eq([participant1, participant2])
    end
  end

  specify 'can add participant to the round' do
    factory.participants.add_participant(user1, round)

    participant = subject.participants_in_round(round).first

    expect(participant).to be_a(RoundParticipant)
    expect(participant.user_id).to eq(user1.id)
    expect(participant.estimation_round_id).to eq(round.id)
  end
end
