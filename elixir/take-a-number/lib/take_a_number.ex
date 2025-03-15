defmodule TakeANumber do
  @moduledoc """
    Silly little PID experiment
  """

  @doc """
    Starts a take-a-number process up.
  """
  def start() do
    spawn(fn -> loop(0) end)
  end

  @doc false
  defp loop(number) do
    receive do
      {:report_state, client_pid} ->
        _ = send(client_pid, number)
        loop(number)
      {:take_a_number, client_pid} ->
        # number =+ 1
        new_number = number + 1
        _ = send(client_pid, new_number)
        loop(new_number)
      :stop ->
        :ok
      _ ->
        loop(number)
    end

  end
end
