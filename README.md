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

## Formatting Code

[[source](https://hexdocs.pm/mix/master/Mix.Tasks.Format.html)]

**file**: `.formatter.exs`

```
[
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"]
]
```

run the following without `--check-formatted` to auto-format code

```bash
$ dc run app \
    mix format --check-formatted
```
