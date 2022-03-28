defmodule EchoClient do
  @moduledoc """
  Cliente de Sockets TCP se conecta al servidor por la ip y el puerto especificados
  y envia 10 cadenas de texto de longitud y contenidos aleatorios
  """

  use GenServer


  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end
  ## Callbacks

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, head}, tail) do
    {:noreply, [head | tail]}
  end
end


  def generador_de_cadenas() do
    datos = :crypto.strong_rand_bytes(Enum.random(32..64)) |> Base.encode64(padding: true)
    datos
  end

  #def recibir_cadenas(Sock) do
  #  {:DATOS, cadena_char} = :gen_tcp.recv(Sock, 0)
  #  cadena_char
  #end

  def iniciar_cliente(puerto) do
    opciones = [:binary, active: true]
    {:ok, socket} = :gen_tcp.connect('localhost', puerto, opciones)


    #comunica(socket, "asd")
    Enum.map(1..10, &comunica(socket, &1))
    Process.sleep(30 * 1000)
    Process.exit(self(), :kill)
  end


  def comunica(socket, _n) do
    datos_enviados = generador_de_cadenas()
    :gen_tcp.send(socket, "Se ha enviado la cadena " <> datos_enviados <> "/n")

    receive do
      message -> IO.inspect message
    end
  end

  #def contador_de_cadenas() do
  #  Enum.reduce([1], fn element, sum -> sum + element end)
  #end

  def terminar_conexion(Sock) do
    ok = :gen_tcp.close(Sock)
  end

  def dormir_proceso(segundos) do
    Process.sleep(segundos)
    IO.puts("La conexion se ha cerrado.")
  end
end
