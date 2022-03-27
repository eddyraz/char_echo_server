defmodule Stack do

  @moduledoc """
  Manejador de los workers(clientes)
  usa para esto el paradigma de Genserver


  recibe las peticiones de terminar los workers,
  y emite creacion(spawning de nuevos workers)

  """

  use GenServer

  # Callbacks

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end
end
