RSpec.describe Api.routes do
  describe 'POST /estimation_rooms' do
    it 'rooms to estimation_rooms#create' do
      env   = Rack::MockRequest.env_for('/estimation_rooms', method: 'POST')
      route = described_class.recognize(env)

      expect(route).to be_routable

      expect(route.path).to   eq '/estimation_rooms'
      expect(route.verb).to   eq 'POST'
    end
  end
end
