# Hello

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Phoenix Diagram

A simplified view of a Phoenix Web Application

```
connection
|> endpoint
|> router
|> pipelines  # typically one for browser requests, another for json/api requests
|> controller
```

Controller as pipe chain of functions

```
connection
|> controller
|> common_services
|> action
```

```
connection   # Plug.Conn
|> endpoint  # lib/hello/endpoint.ex
|> browser   # web/router.ex
|> HelloController.world  # web/controllers/hello_controller.ex
|> HelloView.render(  # web/views/hello_view.ex
  "world.html")  # web/templates/hello/world.html.eex
```

## Commands

initial setup

```bash
$ mix phoenix.new . --app hello
$ mix ecto.create
$ mix phoenix.server
```
