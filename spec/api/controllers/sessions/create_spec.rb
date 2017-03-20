require_relative '../../../../apps/api/controllers/sessions/create'

RSpec.describe Api::Controllers::Sessions::Create do
  let(:action) { described_class.new }
  let(:params) { Hash[user: { name: username }] }
  let(:username) { 'the user name' }
  let(:user) { double(id: 'theId', name: username) }

  subject { action.call(params) }

  let(:response) { subject }
  let(:status) { response[0] }
  let(:headers) { response[1] }
  let(:body) { response[2][0] }

  context 'on a valid request' do
    before do
      allow_any_instance_of(UserService).to receive(:create_by_name)
        .with(username).and_return(user)

      subject
    end

    it 'is successful' do
      expect(status).to eq 200
    end

    it 'returns the user id and name as a json' do
      json = { id: 'theId', name: username }.to_json

      expect(body).to eq json
    end

    it 'content type is json' do
      expect(headers["Content-Type"]).to eq 'application/json; charset=utf-8'
    end

    it 'logs user in' do
      expect(action.session[:user_id]).to eq('theId')
    end
  end

  context 'on an invalid request' do
    before do
      allow_any_instance_of(UserService).to receive(:create_by_name)
        .with(username).and_raise(Validator::ValidationError, 'error message')

      subject
    end

    it 'has status 422' do
      expect(status).to eq(422)
    end

    it 'shows message' do
      json = { message: 'error message' }.to_json

      expect(body).to eq json
    end
  end
end
