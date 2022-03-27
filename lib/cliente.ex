defmodule EchoClient do


  @ip_servidor {127, 0, 0, 1}

  def iniciar_cliente(puerto) do


      #{:ok, :socket} = :gen_tcp.connect(host, puerto,[:binary, {:packet, 0}])
      {:ok, :socket} = :gen_tcp.connect(@ip_servidor, @puerto, [:binary, active: true])
      ok = :gen_tcp.send(Sock, "Some Data")
  end


  #def recibir_cadena(cadena) do
  #  cadena
  #  recibir_cadena(cadena)
  #end


  def terminar_conexion(Sock) do
    ok = :gen_tcp.close(Sock)
  end

  def dormir_proceso(segundos)do
    Process.sleep(segundos)
    IO.puts("La conexion se ha cerrado.")
  end

end
