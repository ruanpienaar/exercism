defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language|list]
  end

  
  def remove([]) do
    []
  end
  def remove(list) do
    tl(list)
  end

  def first(list) do
    hd(list)
  end

  def count(list) do
    length(list)
  end

  def functional_list?([]) do
    :false
  end
  def functional_list?([language | t]) do
    functional_list?(t, language_functional?(language))
  end

  defp language_functional?(language) do
    language in functional_language_list()
  end

  defp functional_list?([], answer) do
    answer
  end
  defp functional_list?(_list, false) do
    false
  end
  defp functional_list?([language | t], _answer) do
    functional_list?(t, language_functional?(language))
  end

  defp functional_language_list() do
    ["Clojure", "Haskell", "Erlang", "Elixir", "F#"]
  end
end
