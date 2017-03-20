require_relative '../../../../apps/api/controllers/sessions/destroy'

RSpec.describe Api::Controllers::Sessions::Destroy do
  let(:action) { described_class.new }
  let(:session) { { user_id: 1 } }
  let(:params)  { { 'rack.session' => session } }
  subject { action.call(params) }

  let(:status) { subject[0] }
  let(:headers) { subject[1] }
  let(:body) { subject[2][0] }
  let(:content_type) { headers["Content-Type"] }

  context 'when there is a session' do
    before { subject }

    it 'is successful' do
      expect(status).to eq 200
    end

    it 'is successful' do
      expect(action.session).not_to have_key(:user_id)
    end

    it 'responds with json' do
      expect(content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns formated json' do
      expected_body = { message: 'OK' }.to_json

      expect(body).to eq(expected_body)
    end
  end

  context 'when there is no logged user' do
    before { subject }
    let(:session) { Hash.new }

    it 'is successful' do
      expect(status).to eq 200
    end

    it 'is successful' do
      expect(action.session).not_to have_key(:user_id)
    end

    it 'responds with json' do
      expect(content_type).to eq('application/json; charset=utf-8')
    end

    it 'returns formated json' do
      expected_body = { message: 'OK' }.to_json

      expect(body).to eq(expected_body)
    end
  end
end
