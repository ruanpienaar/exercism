defmodule NameBadge do

  def print(id, name, department) do
    print_check_id(id, name, fill_department(department))
  end

  defp fill_department(department) do
    if department == nil, do: "owner", else: department
  end

  defp print_check_id(id, name, department) do
    badge = basic_badge_string(name, department)
    if id != nil do
      "[#{id}] - " <> badge
    else 
      badge
    end
  end

  defp basic_badge_string(name, department) do
    "#{name} - #{String.upcase(department)}"
  end

end
