RSpec.describe Web.routes do
  describe 'GET /sessions/new' do
    it 'routes to sessions#new' do
      env   = Rack::MockRequest.env_for('/sessions/new', method: 'get')
      route = described_class.recognize(env)

      expect(route).to be_routable

      expect(route.path).to   eq '/sessions/new'
      expect(route.verb).to   eq 'GET'
    end
  end
end
