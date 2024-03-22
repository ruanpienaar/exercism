defmodule Username do
  def sanitize(username) do
    username
    |> Enum.reduce([], &convert_or_exclude/2)
    |> Enum.reverse()
  end

  defp convert_or_exclude(c, acc) do
    case c do
      ?ä -> ~c"ea" ++ acc
      ?ö -> ~c"eo" ++ acc
      ?ü -> ~c"eu" ++ acc
      ?ß -> ~c"ss" ++ acc
      ?_ -> [c | acc]
      c when c >= ?a and c <= ?z -> [c | acc]
      _ -> acc
    end
  end
end
