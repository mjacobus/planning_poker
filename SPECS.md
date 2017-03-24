Project Specifications/Ideas
----------------------

## Entities

```yml
Room:
  admin_uuid: string
  voting_uuid: string
  name: string
  description: string
  stories: []
  has_many: Estimations
  has_many: Stories

Story:
  room_id:
  url: string
  name: string
  description: string
  current: boolean
  status:
    - not_estimated
    - estimated
    - estimation_started
    - estimation_finished
    - current_topic
  has_many: EstimationRounds

EstimationRound:
  id: integer
  story_id: integer
  sequence: integer
  status:
    - ongoing
    - finished
    - cancelled

RoundParticipants:
  user_id: integer
  round_id: integer
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


## Services

```ruby

moderation_service = ModerationService.new(room)
moderation_service.set_topic_for_estimation(story)     # set current estimation topic for the room
moderation_service.current_topic                       # get current estimation topic for the room
moderation_service.estimate_current_topic_with(value)  # define the estimation value for the current topic
moderation_service.start_new_round                     # starts a new round
moderation_service.current_round                       # starts a new round

round = EstimationRoundService.new(round, user)
round.join                                             # set participant estimation
round.leave                                            # set participant estimation
round.estimate(value)                                  # set participant estimation
round.revoke_estimation                                # revoke participant estimation
```
