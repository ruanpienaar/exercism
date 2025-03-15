defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/^\[DEBUG\]|\[INFO\]|\[ERROR\]|\[WARNING\]/
  end

  def split_line(line) do
    Regex.split(~r/<[~|*|=|-]*>/, line, global: true)
  end

  def remove_artifacts(line) do
    Regex.replace(~r/end-of-line\d+/i, line, "")
  end

  # LogParser.tag_with_user_name("[INFO] User Alice created a new project")
  # => "[USER] Alice [INFO] User Alice created a new project"
  def tag_with_user_name(line) do
    tag_with_user_name(line, Regex.named_captures(~r/User *(?<user>\S+)/, clean_line(line)))
  end

  defp tag_with_user_name(line, nil) do
    line
  end

  defp tag_with_user_name(line, %{"user" => user}) do
    "[USER] #{user} #{line}"
  end

  defp clean_line(line) do
    Regex.replace(~r/\t|\n/, line, " ")
  end
end
