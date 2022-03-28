defmodule RestartTest do
  use GenServer
  require Logger


  def start_link(_),
  do: GenServer.start_link(__MODULE__,{})

  def init(state) do
    Logger.info("Se esta iniciando el proceso")
    Process.send_after(self(),:ded,:timer.seconds(3))
    {:ok, state}
  end

  @impl true
  def handle_info(:ded, state) do
    Logger.info("Terminando proceso")
    {:stop,:ded, state}
  end
end
