# Rumbl

## Generating Resources

* `phoenix.gen.html` - HTML scaffold
* `phoenix.gen.json` - JSON scaffold

generate a video resource

```bash
$ dc run app \
    mix phoenix.gen.html Video videos \
      user_id:references:users \
      url:string \
      title:string \
      description:text
$ dc run app \
    mix ecto.migrate
```
