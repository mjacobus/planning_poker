describe UserSessionService do
  let(:session) { Hash.new }
  subject { described_class.new(session) }

  describe '#login' do
    it 'saves user id in the session' do
      subject.login(double(id: 'theId'))

      expect(session[:user_id]).to eq('theId')
    end
  end

  describe '#logout' do
    it 'logs the user out' do
      session[:user_id] = 1

      subject.logout

      expect(session).to eq({})
      expect(subject.current_user).to be nil
    end
  end

  describe '#logged_in?' do
    it 'returns true when user is logged in' do
      session[:user_id] = 1

      expect(subject.logged_in?).to be(true)
    end

    it 'returns false when no user is logged in' do
      expect(subject.logged_in?).to be(false)
    end
  end

  describe '#current user' do
    context 'when logged out' do
      it 'returns nil when user is logged out' do
        expect(subject.current_user).to be(nil)
      end
    end

    context 'when logged in' do
      let(:user) { double(:user) }

      before do
        session[:user_id] = 1
        allow_any_instance_of(UserService).to receive(:find_by_id).with(1).and_return(user.dup)
      end

      it 'returns the current user when logged in' do
        expect(subject.current_user.to_json).to eq(user.to_json)
      end

      it 'memoizes user' do
        expect(subject.current_user).to be(subject.current_user)
      end
    end
  end
end
