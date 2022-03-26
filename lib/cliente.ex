defmodule EchoClient do


  def iniciar_cliente(host,puerto) do
    cliente() ->
      IP_Servidor = host,
      {ok, Sock} = gen_tcp:connect(IP_Servidor, puerto,[binary, {packet, 0}]),
      ok = gen_tcp:send(Sock, "Some Data"),
  end


  def terminar_conexion()do
    ok = gen_tcp:close(Sock).
  end

  def dormir_proceso(segundos)do
    Process.sleep(segundos)
    IO.puts("La conexion se ha cerrado.")
  end

end
