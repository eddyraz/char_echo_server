defmodule CharEchoServer do
  require Logger

  @moduledoc """
  El servidor se debe iniciar llamando a CharEchoServer.aceptar_conexion(puerto)
  donde puerto es el numero del puerto donde la app estara escuchando.
  La aplicacion acepta cadenas de caracteres de longitud variable y
  las devuelve tal como las recibe al recibir
  el caracter especial de salto de linea(ENTER).
  """

  def aceptar_conexion(puerto) do
    {:ok, socket} =
      :gen_tcp.listen(puerto, [:binary, packet: :line, active: true, reuseaddr: true])

    Logger.info("Estamos aceptando conexiones en el puerto #{puerto}")
    {:ok, cliente} = :gen_tcp.accept(socket)
    servir_socket(cliente)
  end

  defp servir_socket(socket) do
    socket |> leer_caracteres() |> escribir_caracteres(socket)
    servir_socket(socket)
  end

  defp leer_caracteres(socket) do
    receive do
      {:tcp, _socket, data} ->
        Logger.info("Hemos recibido la cadena #{inspect(data)};\r\n\r\n")
        data
    end
  end

  defp escribir_caracteres(linea_caracteres, socket) do
    :gen_tcp.send(socket, linea_caracteres <> "_0998899_")
    Logger.info("Enviando cadena  #{linea_caracteres}" <> "_09988990_")
  end
end
