defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    shot_radius = :math.sqrt(x ** 2 + y ** 2)

    cond do
      shot_radius <= 1 ->
        10

      shot_radius > 1 and shot_radius <= 5 ->
        5

      shot_radius > 5 and shot_radius <= 10 ->
        1

      shot_radius > 10 ->
        0

      true ->
        0
    end
  end
end
