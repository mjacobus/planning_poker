Project Specifications/Ideas
----------------------


```yml
Room:
  admin_uuid: string
  voting_uuid: string
  name: string
  description: string
  stories: []

Story:
  room_id:
  url: string
  name: string
  description: string
  estimation: string
  status: string
  rounds: []

Participant:
  role: string [voter, observer]
  user_id: integer
  story_id: integer

EstimationRound:
  id: integer
  uuid: string
  story_id: integer
  sequence: integer

Estimation:
  round_id:
  user_id:
  estimation: string

Estimation::User:
  name: string
```

GET room
```yml
Request:
  admin_uuid: string
Response:
  name: string
  description: string
  stories: array
  admin_uuid: string
  voting_uuid: string
```

## Features:
  - User logs in
  - User create room
  - User adds stories to room
  - User fetches room with stories
  - *TODO*
    - User joins room for voting
    - User votes on story
    - Moderator starts voting
    - Moderator finishes voting
    - Can round story result


```ruby
moderator_service = ModeratorService.new(room)
moderator_service.set_topic(story)         # set current estimation topic for the room
moderator_service.current_topic            # get current estimation topic for the room
moderator_service.reset_estimation         # current estimation/story
moderator_service.assign_estimation(value) # define the estimation value for the current topic
moderator_service.assign_voter(user)       # assign voter to current topic
moderator_service.unassign_voter(user)     # unassign voter for current topic

participant = UserEstimationService.new(room, current_user, story)
participant.estimate(value)                # set participant estimation
participant.revoke_estimation              # revoke participant estimation
```
