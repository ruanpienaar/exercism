defmodule WineCellar do
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  def filter(cellar, colour, opts \\ []) do
    for {wine_colour, {_type, year, country} = wine_details} <- cellar,
        wine_colour === colour,
        Keyword.get(opts, :year, year) == year,
        Keyword.get(opts, :country, country) == country,
        do: wine_details
  end
end
