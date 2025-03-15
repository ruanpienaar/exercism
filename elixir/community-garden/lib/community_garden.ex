# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

# I would've rather used a map, to make lookups nicer ...
defmodule CommunityGarden do

  defstruct [:plot_counter, :plots]

  def start(opts \\ []) do
    Agent.start(
      fn ->
        %__MODULE__{
          plot_counter: 0,
          plots: []
        }
      end,
      opts
    )
  end

  def list_registrations(pid) do
    Agent.get(pid, fn %__MODULE__{plots: plots} -> plots end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(
      pid,
      fn state = %__MODULE__{plot_counter: c, plots: plots} ->
        new_plot_counter = c + 1
        new_plot = %Plot{
          plot_id: new_plot_counter,
          registered_to: register_to
        }
        {new_plot, %__MODULE__{ state | plot_counter: new_plot_counter, plots: [new_plot | plots ]}}
      end
    )
  end

  def release(pid, plot_id) do
    Agent.update(
      pid,
      fn state = %__MODULE__{plots: plots} ->
        %__MODULE__{ state | plots: drop_plot_id(plots, plot_id)}
      end
    )
  end

  def drop_plot_id(plots, plot_id) do
    plots
    |> Enum.reject(fn %Plot{plot_id: p} -> p === plot_id end)
  end

  def get_registration(pid, plot_id) do
    get_registration(
      Agent.get(
        pid,
        fn %__MODULE__{plots: plots} ->
          plots
          |> Enum.find(
          fn p = %Plot{plot_id: ^plot_id} -> p end
        )
      end)
    )
  end

  defp get_registration(nil) do
    {:not_found, "plot is unregistered"}
  end

  defp get_registration(x) do
    x
  end

end
