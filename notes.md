# notes

install [inotify-tools](https://github.com/inotify-tools/inotify-tools/wiki), then

```bash
$ psql -v
$ node -v
$ elixir -v
$ mix local.hex
$ mix archive.install hex phx_new 1.5.8
```

```bash
$ mix phx.new . --app hello
$ mix deps.get
# add 'socket_dir: "/var/run/postgresql"' to config/dev.exs
$ mix ecto.create
$ mix phx.server
```
