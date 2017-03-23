# frozen_string_literal: true
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
  let(:json) { { "foo": 'bar' } }

  context 'on a valid request' do
    before do
      allow_any_instance_of(UserService).to receive(:create_by_name)
        .with(username).and_return(user)

      stub_serializer(UserSerializer, user, :user) { json }

      subject
    end

    it 'is successful' do
      expect(status).to eq 200
    end

    it 'returns the user id and name as a json' do
      expect(subject).to have_json_body(json)
    end

    it 'content type is json' do
      expect(headers['Content-Type']).to eq 'application/json; charset=utf-8'
    end

    it 'logs user in' do
      expect(action.session[:user_id]).to eq('theId')
    end
  end

  context 'on an invalid request' do
    before do
      exception = ValidationError.new('foo')
      stub_serializer(ExceptionSerializer, exception) { json }

      allow_any_instance_of(UserService).to receive(:create_by_name)
        .with(username).and_raise(exception)

      subject
    end

    it 'has status 422' do
      expect(status).to eq(422)
    end

    it 'shows message' do
      expect(subject).to have_json_body(json)
    end
  end
end
