# README

**Ruby version: 2.6.3p62**

##Authentication:
`X-User-Email:name@mail.com`
`X-User_Token:-Token-`

##API use:

`GET /api/v1/schedules.json`

response sample:
```json
[
    {
        "id": 2,
        "pin": 1,
        "state": 0,
        "fire_on": "2019-08-17T02:38:35.210Z",
        "user_id": 1,
        "created_at": "2019-08-17T02:38:35.210Z",
        "updated_at": "2019-08-17T02:38:35.210Z"
    },
    {  
        "id": 3,
        "pin": 1,
        "state": 0,
        "fire_on": "2019-08-30T23:00:00.000Z",
        "user_id": 1,
        "created_at": "2019-08-17T02:42:44.613Z",
        "updated_at": "2019-08-17T02:42:44.613Z"
    },
    {
        "id": 4,
        "pin": 1,
        "state": 0,
        "fire_on": "2019-08-17T02:42:56.049Z",
        "user_id": 1,
        "created_at": "2019-08-17T02:42:56.049Z",
        "updated_at": "2019-08-17T02:42:56.049Z"
    }
]

```
`DELETE /api/v1/schedules/3`

response:
```json
{
    "id": 3,
    "pin": 1,
    "state": 0,
    "fire_on": "2019-08-30T23:00:00.000Z",
    "user_id": 1,
    "created_at": "2019-08-17T02:42:44.613Z",
    "updated_at": "2019-08-17T02:42:44.613Z"
}
```

`POST /api/v1/schedules.json?schedule[pin]=1&schedule[state]=true&schedule[fire_on]=2019-08-30 23:00:00`

response:
```json
{
    "id": 5,
    "pin": 7,
    "state": 0,
    "fire_on": "2019-08-30T23:00:00.000Z",
    "user_id": 1,
    "created_at": "2019-08-30T02:52:20.366Z",
    "updated_at": "2019-08-30T02:52:20.366Z"
}
```

`DELETE /api/v1/schedules/1`