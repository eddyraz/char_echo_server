defmodule EchoClient do
  @moduledoc """
  Cliente de Sockets TCP se conecta al servidor por la ip y el puerto especificados
  y envia 10 cadenas de texto de longitud y contenidos aleatorios al recibir la 10ma cadena
  se pone a 'dormir' durante 30 segundos y despues

  """

  require Logger

  def generador_de_cadenas() do
    datos = :crypto.strong_rand_bytes(Enum.random(32..64)) |> Base.encode64(padding: false)
    Logger.info("Enviando cadena #{datos}")
    datos
  end

  def iniciar_cliente(puerto) do
    opciones = [:binary, active: true]
    {:ok, socket} = :gen_tcp.connect('localhost', puerto, opciones)

    comunica(socket, "asd")
    Enum.map(1..10, &comunica(socket, &1))
    dormir_proceso(30)
    cerrar_conexion(socket)

    matar_proceso()
  end

  def comunica(socket, _n) do
    :gen_tcp.send(socket, generador_de_cadenas() <> "\n")

    receive do
      :ok -> dormir_proceso(300)
      #{:tcp, _socket, data} -> data
      message -> cadena_recibida = IO.inspect(message)
      #IO.puts("Hola estamos recibiendo #{message}")
      Logger.info("Se ha recibido la cadena #{inspect(message)};\r\n\r\n")

      message
    end
  end


  def dormir_proceso(segundos) do
    Process.sleep(segundos * 1000)
  end

  def cerrar_conexion(socket) do
    :ok  = :gen_tcp.close(socket)
    Logger.info("La conexion con el servidor se ha cerrado")
  end

  def matar_proceso() do
    Process.exit(self(), :kill)
  end

end
