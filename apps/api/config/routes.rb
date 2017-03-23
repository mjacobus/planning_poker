# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
post '/estimation_rooms', to: 'estimation_rooms#create'
post '/sessions', to: 'sessions#create'
delete '/sessions', to: 'sessions#destroy'
get '/sessions/destroy', to: 'sessions#destroy'

#
# stories
#
post '/estimation_rooms/:admin_uuid/stories', to: 'estimation_rooms/stories#create'
get '/estimation_rooms/:admin_uuid', to: 'estimation_rooms#show'
