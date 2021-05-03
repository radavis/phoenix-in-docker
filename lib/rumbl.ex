defmodule Rumbl do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Rumbl.Repo, []),
      supervisor(Rumbl.InfoSys.Supervisor, []),
      supervisor(Rumbl.Endpoint, []),
    ]

    opts = [strategy: :one_for_all, name: Rumbl.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Rumbl.Endpoint.config_change(changed, removed)
    :ok
  end
end
