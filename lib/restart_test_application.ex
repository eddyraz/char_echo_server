defmodule Application do


  use Application

  @impl true
  def start(_type,_args) do
    children = [
      #Start a Worker by calling RestartTest.Worker.start_link(arg)
      RestartTest,
    ]

    opts = [strategy: :one_for_one, name: Supervisor]
    Supervisor.start_link(children, opts)
  end
end
