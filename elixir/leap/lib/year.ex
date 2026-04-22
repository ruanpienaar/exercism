defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    four = rem(year, 4) == 0
    hundred = rem(year, 100) == 0
    four_hundred = rem(year, 400) == 0

    cond do
      four_hundred and four ->
        true

      four and !hundred ->
        true

      true ->
        false
    end
  end
end
