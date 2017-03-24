# frozen_string_literal: true
RSpec.describe EstimationRoundService do
  let(:service) { EstimationRoundService.new(user: user1, round: round) }

  let(:story) { factory.create_story }
  let(:round) { factory.create_round(story_id: story.id) }
  let(:user1) { factory.create_user }
  let(:user2) { factory.create_user }
  let(:participant1) { factory.participants.add_participant(user1, round) }
  let(:participant2) { factory.participants.add_participant(user2, round) }

  before do
    factory.clear_all
    participant1
    participant2

    expect(service.participating?).to be(true)
  end

  specify 'a user can leave a round' do
    service.leave
    service.leave

    in_round = factory.participants.participants_in_round(round).to_a

    expect(in_round).to eq([participant2])
    expect(service.participating?).to be(false)
  end

  specify 'can join a round' do
    service.leave

    # does not matter how many time
    service.join
    service.join

    in_round = factory.participants.participants_in_round(round).to_a

    expect(in_round.count).to be 2
    expect(service.participating?).to be(true)
  end

  specify 'can estimate' do
    service.estimate(2)

    expect(service.estimation).to eq '2'

    service.estimate('foo')

    expect(service.estimation).to eq 'foo'
  end

  specify 'can revoke estimation' do
    service.estimate(2)
    service.revoke_estimation

    expect(service.estimation).to be_nil
  end

  specify 'throws exception when tries to estimate while not participating' do
    service.leave

    expect do
      service.estimate(2)
    end.to raise_error(EstimationRoundService::NotParticipatingError)
  end
end
