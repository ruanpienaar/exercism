defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    itterate(true, list, fun)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    itterate(false, list, fun)
  end

  def itterate(criteria, list, fun) do
    itterate(criteria, list, fun, [])
  end

  defp itterate(_criteria, [], _fun, result) do
    result
  end

  defp itterate(criteria, [h | t], fun, result) do
    case fun.(h) do
      ^criteria ->
        itterate(criteria, t, fun, result ++ [h])

      _ ->
        itterate(criteria, t, fun, result)
    end
  end
end
