# README

```
curl -XPOST -H 'Content-Type: application/json' http://localhost:3000/api/v1/mails -d '{"subject": "test", "to": "12", "from": "123", "template_id": "1" }'
curl -XPOST -H 'Content-Type: application/json' http://localhost:3000/api/v1/mails -d '{"subject": "test1", "to": "123", "from": "456", "template_id": "1", "court_date": "2019-01-01", "denomination": "zxcvbn", "civility": "qwerty" }'
```
