defmodule BirdCount do
  def today([]) do
    nil
  end
  def today([h | _]) do
    h
  end

  def increment_day_count([]) do
    [1]
  end
  def increment_day_count([ h | t ]) do
    [ h + 1 | t ]
  end

  def has_day_without_birds?(list) do
    0 in list
  end

  def total([]) do
    0
  end
  def total([h | t]) do
    h + total(t)
  end

  def busy_days([]) do
    0
  end
  def busy_days([h | t]) when h >= 5 do
    busy_days(t) + 1
  end
  def busy_days([_h | t]) do
    busy_days(t)
  end
end
