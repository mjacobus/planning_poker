# frozen_string_literal: true
RSpec.describe ModerationService do
  before do
    factory.rooms.clear
    factory.stories.clear
    factory.rounds.clear
  end

  let(:room) { factory.create_room }
  let(:story) { factory.create_story(room_id: room.id) }

  subject { described_class.new(room: room) }
  let(:service) { subject }

  it 'takes a room as constructor argument' do
    expect(service.room).to be(room)
  end

  describe 'when a topic is set for estimation' do
    let(:same_room_story) { factory.create_story(room_id: room.id, current: true) }
    let(:other_room_story) { factory.create_story(current: true) }

    before do
      other_room_story
      same_room_story
      service.set_topic_for_estimation(story)
    end

    it 'sets the story #current to true' do
      expect(factory.reload(story).current).to be(true)
    end

    it 'sets other rooms stories to #current false' do
      expect(factory.reload(same_room_story).current).to be(false)
      expect(factory.reload(other_room_story).current).to be(true)
    end
  end

  describe '#current_topic' do
    it 'throws an exception when no topic exists' do
      expect do
        expect(service.current_topic)
      end.to raise_error(ModerationService::CurrentTopicNotSetError)
    end

    it 'returns the current topoic when it was set' do
      service.set_topic_for_estimation(story)

      expect(service.current_topic).to eq(story)
    end
  end

  describe '#estimate_current_topic' do
    context 'when there is a current topic' do
      let(:value) { 'five' }

      before do
        subject.set_topic_for_estimation(story)
        subject.estimate_current_topic_with(value)
      end

      it 'sets the estimation value' do
        expect(factory.reload(story).estimation).to eq(value)
      end

      it 'changes the story status to estimated' do
        expect(factory.reload(story).estimated?).to be(true)
      end
    end
  end

  describe '#start_new_round' do
    let(:round) { subject.start_new_round }

    before do
      subject.set_topic_for_estimation(story)
      round
    end

    it 'creates a new round' do
      expect(factory.rounds.all.count).to eq(1)
      expect(round).to be_a(EstimationRound)
      expect(round.story_id).to eq(story.id)
      expect(round.ongoing?).to be(true)
    end
  end

  describe '#current_round' do
    before { subject.set_topic_for_estimation(story) }

    it 'returns the current round when there is one' do
      Timecop.freeze(Time.now - 30) do
        subject.start_new_round
      end

      round = subject.start_new_round

      expect(factory.rounds.all.count).to eq(2)
      expect(subject.current_round).to eq(round)
    end

    it 'throws exception when there are no rounds' do
      expect { subject.current_round }.to raise_error(
        ModerationService::RoundNotCreatedYetError
      )
    end
  end
end
