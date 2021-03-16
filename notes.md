# phoenix-in-docker

adapted from: [[source](https://blog.cloud66.com/deploying-your-phoenix-applications-in-production-using-docker/)]

**Goal**: create a working development environment for examples in _Programming Phoenix_ (April 2016).

before getting started, [install docker](https://radavis.github.io/ubuntu-for-development/docker.html)

init your development environment via docker-compose

```bash
$ alias dc="docker-compose"
$ cp .env.example .env
$ nano .env  # configure psql database name, username, password
$ dc build
$ dc up
```

you will take down your environment and rebuild, as necessary

```bash
$ dc down
$ dc rm
$ dc build
$ dc up
```

create a new phoenix application

```bash
$ dc run app \
    mix phoenix.new # to get help text
$ dc run app \
    mix phoenix.new . --app hello
$ dc run app \
    mix ecto.create
$ sudo chown -R ${USER}:${USER} .  # fix permissions of generated files
```

initialize the application database

```elixir
# config/dev.exs

config :hello, Hello.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 10
```

```bash
$ dc up
$ dc run app \
    mix ecto.create
```

uncomment lines in `Dockerfile.development`, then `dc down && dc build`

boot it up!

```bash
$ dc up
```

visit <http://localhost:4000/>

---

see which files violate elixir formatting rules, remove `--check-formatted` to
format source code

```bash
$ dc run app \
    mix format --check-formatted
```
