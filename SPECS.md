Project Specifications/Ideas
----------------------

```yml
Estimation::Room:
  moderation_uuid: string
  voting_uuid: string
  name: string
  description: string
  stories: []

Estimation::Story:
  room_id:
  url: string
  name: string
  description: string
  final_estimation: string
  rounds: []

Estimation::Round:
  user_id: integer
  story_id: integer
  estimation: string
  status: string (in_progress, finished)

Estimation::User:
  name: string
```