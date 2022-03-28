defmodule SupervisorDeProcesos do

  @puerto 9000

  def start do
    children = [ {EchoClient, []}]
    Supervisor.start_link(children, name: :supervisor_de_procesos, strategy: :one_for_one)
  end
end
