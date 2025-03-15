defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    battery_percentage: 100,
    distance_driven_in_meters: 0
  ]

  def new(nickname \\ "none")

  def new(nickname) do
    %__MODULE__{
      nickname: nickname
    }
  end

  def display_distance(remote_car) when is_struct(remote_car, __MODULE__) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(%__MODULE__{battery_percentage: perc} = remote_car)
      when is_struct(remote_car, __MODULE__) do
    "Battery #{if perc > 0, do: "at #{perc}%", else: "empty"}"
  end

  def drive(%__MODULE__{battery_percentage: perc, distance_driven_in_meters: dist} = remote_car)
      when is_struct(remote_car, __MODULE__) do
    case perc > 0 do
      true ->
        %{remote_car | battery_percentage: perc - 1, distance_driven_in_meters: dist + 20}

      false ->
        remote_car
    end
  end
end
