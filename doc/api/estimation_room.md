Estimation Room
----------------

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
