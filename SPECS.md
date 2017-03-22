Project Specifications/Ideas
----------------------

```yml
Estimation::Room:
  admin_uuid: string
  voting_uuid: string
  name: string
  description: string
  stories: []

Estimation::Story:
  room_id:
  url: string
  name: string
  description: string
  estimation: string
  status: string
  rounds: []

Estimation::Round:
  user_id: integer
  story_id: integer
  estimation: string
  status: string (in_progress, finished)

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
