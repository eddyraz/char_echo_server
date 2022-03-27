defmodule VacuumEchoClient do

  @moduledoc """
  Modulo de testeo de cliente TCP

  """

  def start_char_window() do
    IO.puts(vacuum_loop())
    start_char_window()
  end

  def vacuum_loop() do
    t = IO.gets("Escribe algo \n")
    t
  end

  def contador_de_cadenas() do
    Enum.reduce([1], fn element, sum -> sum + element end)
  end

  #def generador_de_cadenas() do
  #  :crypto.strong_rand_bytes(Enum.random(0..255)) |> Base.encode64(padding: false)
  #end
end
