# Rumbl

Generate the `Rumbl.Category` model

```bash
$ mix phoenix.gen.model Category categories name:string
```

Generate a migration to add `category_id` to the `videos` table

```bash
$ mix ecto.gen.migration add_category_id_to_video
```

Run migrations and seeds

```bash
$ mix ecto.migrate
$ mix run priv/repo/seeds.exs
```
