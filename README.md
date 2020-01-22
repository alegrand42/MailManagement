# README

## Template
Any mail has a text which is built through templates.
On the home page, create few templates by adding a code and a title.
All templates are listed on this page.

## Mail
Once a template is created.
You can create a mail that way:

```
curl -XPOST -H 'Content-Type: application/json' http://localhost:3000/api/v1/mails -d '{"subject": "test", "to": "12", "from": "123", "template_id": "1" }'
curl -XPOST -H 'Content-Type: application/json' http://localhost:3000/api/v1/mails -d '{"subject": "test1", "to": "123", "from": "456", "template_id": "1", "court_date": "2019-01-01", "denomination": "zxcvbn", "civility": "qwerty" }'
```
All mails can be found at the following address:
```
http://localhost:3000/api/v1/mails
```
The first mail can be found here:
```
http://localhost:3000/api/v1/mails/1
```


## Send Message

To send the second mail through mailgun.

```
http://localhost:3000/api/v1/mails/2/send_msg
```
