# Rumbl

create `annotation` model

```bash
$ dc exec app \
    mix phoenix.gen.model Annotation annotations \
    body:text \
    at:integer \
    user_id:references:users \
    video_id:references:videos
```
