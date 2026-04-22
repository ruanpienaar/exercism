defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(digits, input_base, output_base) when output_base >= 2 do
    # TODO: check each digit is below or equal to input_base

    # 465
    #  4 times b^{2} + 6 times b^{1} + 5 times b^{0}

    # -1 due to Elixir counting from 1 upwards, not
    {:ok,
     Enum.zip(Range.new(length(digits), 0, -1), digits)
     |> Enum.map(fn {place, digit} ->
       digit * :math.pow(input_base, place)
     end)}
  end

  def convert(_, _, output_base) when output_base < 2 do
    {:error, "output base must be >= 2"}
  end

  def convert(_, input_base, output_base) when output_base >= 2 and input_base < 2 do
    {:error, "input base must be >= 2"}
  end
end
