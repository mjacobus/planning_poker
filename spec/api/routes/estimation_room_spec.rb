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

  describe 'POST /estimation_rooms/:admin_uuid/stories' do
    it 'rooms to estimation_rooms/stories#create' do
      env   = Rack::MockRequest.env_for(
        '/estimation_rooms/the-admin-uuid/stories',
        method: 'POST'
      )
      route = described_class.recognize(env)

      expect(route).to be_routable

      expect(route.path).to   eq '/estimation_rooms/the-admin-uuid/stories'
      expect(route.verb).to   eq 'POST'
      expect(route.params[:admin_uuid]).to   eq 'the-admin-uuid'
    end
  end

  describe 'POST /estimation_rooms/:admin_uuid' do
    it 'rooms to estimation_rooms#show' do
      env   = Rack::MockRequest.env_for(
        '/estimation_rooms/the-admin-uuid',
        method: 'GET'
      )
      route = described_class.recognize(env)

      expect(route).to be_routable

      expect(route.path).to   eq '/estimation_rooms/the-admin-uuid'
      expect(route.verb).to   eq 'GET'
      expect(route.params[:admin_uuid]).to   eq 'the-admin-uuid'
    end
  end
end
