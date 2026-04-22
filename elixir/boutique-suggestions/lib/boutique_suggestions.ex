defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ [])

  def get_combinations(tops, bottoms, options) do
    for top <- tops,
        bottom <- bottoms,
        top.base_color != bottom.base_color,
        Keyword.get(options, :maximum_price, 100.00) > top.price + bottom.price do
      {top, bottom}
    end
  end
end

# Keyword.get(options, :maximum_price, -1) > top.price + bottom.price
