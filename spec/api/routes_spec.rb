RSpec.describe Api.routes do
  describe 'POST /sessions' do
    it 'routes to sessions#create' do
      env   = Rack::MockRequest.env_for('/sessions', method: 'POST')
      route = described_class.recognize(env)

      expect(route).to be_routable

      expect(route.path).to   eq '/sessions'
      expect(route.verb).to   eq 'POST'
    end
  end

  describe 'DELETE /sessions' do
    it 'routes to sessions#destroy' do
      env   = Rack::MockRequest.env_for('/sessions', method: 'delete')
      route = described_class.recognize(env)

      expect(route).to be_routable

      expect(route.path).to   eq '/sessions'
      expect(route.verb).to   eq 'DELETE'
    end
  end

  describe 'GET /sessions/destroy' do
    it 'routes to sessions#destroy' do
      env   = Rack::MockRequest.env_for('/sessions/destroy', method: 'get')
      route = described_class.recognize(env)

      expect(route).to be_routable

      expect(route.path).to   eq '/sessions/destroy'
      expect(route.verb).to   eq 'GET'
    end
  end
end
