Estimation Room
----------------

Examples:

Please run `bundle exec rake dev:db:repopulate`:

- Admin:
  _ Backend: http://localhost:2300/api/estimation_rooms/admin-uuid-1
  _ Frontend: http://localhost:3000/room/admin-uuid-1/admin

-  Story Status:
   - Backend: http://localhost:2300/api/estimation_rooms/uuid-1/stories/{story_id}/status
   - Frontend: ?






Under construction
-----------------------------------

Creating a new Payload

```javascript
// Endpoint: POST /api/estimation_rooms

// Payload:
{
  estimation_room: {
    name: 'room name',
    description: 'some description',
  }
}

// response:
{
  estimation_room: {
    id: 'some id',
    name: 'room name',
    description: 'some description',
    admin_uuid: 'some description',
    voting_uuid: 'some description',
    created_at: 'the date',
    updated_at: 'the date',
  }
}
```
