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

Feature:
  - User logs in
  - User create room
  - User adds stories to room
  - User fetches room with stories

# TODO

  - User joins room for voting
  - User votes on story
  - Moderator starts voting
  - Moderator finishes voting
  - Can round story result

``
