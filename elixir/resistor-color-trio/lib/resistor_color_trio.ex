defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """

  @resistor_colours %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    {main_colors, zeros_colors} = Enum.split(colors, 2)
    # ignore more than 3 colors
    {[only_zeros_colors], _} = Enum.split(zeros_colors, 1)
    only_zeros_colors_code = code(only_zeros_colors)
    how_many_zeros = 1..(only_zeros_colors_code)
      |> Enum.reduce([], fn _, a -> a ++ ["0"] end)
      |> length()
    {how_many_zeros_to_add_to_number, unit} = get_unit({how_many_zeros, :ohms})
    {
      main_colors
        |> Enum.slice(0..2)
        |> Enum.map(&code/1)
        |> Enum.reduce(
          "",
          fn
            c, a when c == 0 and a != "" ->
              a
            c, a ->
              a <> "#{Integer.to_string(c)}"
          end
        )
        |> Kernel.<>(Integer.to_string(how_many_zeros_to_add_to_number))
        |> String.to_integer(),
        unit
    }
  end

  defp code(color) do
    Map.get(@resistor_colours, color, :not_found)
  end

  def get_unit({how_many_zeros, unit}) when how_many_zeros < 3  do
    {how_many_zeros, unit}
  end

  def get_unit({how_many_zeros, unit}) when how_many_zeros >= 3  do
    get_unit({div(how_many_zeros, 3), get_next_unit(unit)})
  end

  def get_next_unit(:ohms) do
    :kiloohms
  end

  def get_next_unit(:kiloohms) do
    :megaohms
  end

end
