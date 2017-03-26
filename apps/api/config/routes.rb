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


# Controlls
#
#   POST   /estimation_room/:admin_uuid/stories/:id/start  current_estimation#start
#   POST   /estimation_room/:admin_uuid/current/start      current_estimation#start
#   POST   /estimation_room/:admin_uuid/current/reset      current_estimation#reset
#   PUT    /estimation_room/:admin_uuid/current/estimate   current_estimation#set_estimation

# Voting
#
#   POST     /estimation_room/:room_uuid/current                current_estimation#join
#   DELETE   /estimation_room/:room_uuid/current                current_estimation#exit
#   PUT      /estimation/:room_uuid/current/estimate            current_estimation#estimate
#   DELETE   /estimation/:room_uuid/current/revoke_estimation   current_estimation#revoke_estimation

# Visualization
#
#   GET   /estimation_room/:room_uuid/current/status   current_estimation#status
