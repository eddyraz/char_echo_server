defmodule EchoClient do

  @moduledoc """
  Cliente de Sockets TCP se conecta al servidor por la ip y el puerto especificados
  y envia 10 cadenas de texto de longitud y contenidos aleatorios

  """

  def iniciar_cliente(puerto) do
    opciones = [:binary, active: false]
    {:ok, socket} = :gen_tcp.connect('localhost', puerto ,opciones)
    ok = :gen_tcp.send(Sock, generador_de_cadenas() <> "\n")
  end



  def generador_de_cadenas() do
    :crypto.strong_rand_bytes(Enum.random(0..255)) |> Base.encode64(padding: false)

  end

  def recibir_cadenas(Sock) do
    {:DATOS, cadena_char} = :gen_tcp.recv(Sock,0)
    cadena_char
    recibir_cadenas(Sock)
  end

  def contador_de_cadenas() do
    Enum.reduce([1], fn element, sum -> sum + element end)
  end

  def terminar_conexion(Sock) do
    ok = :gen_tcp.close(Sock)
  end

  def dormir_proceso(segundos) do
    Process.sleep(segundos)
    IO.puts("La conexion se ha cerrado.")
  end

end
