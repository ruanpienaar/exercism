defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tree :: tuple() | list(), non_neg_integer()) ::
          {:ok, non_neg_integer()} | :not_found
  def search(tree, looking_for) when is_tuple(tree) do
    search(Tuple.to_list(tree), looking_for)
  end

  def search(tree, looking_for) when is_list(tree) do
    # Enum.At zero based ( hence -1 )
    middle = length(tree) * 0.5 - 1
    middle_number = Enum.at(tree, middle)

    case looking_for == middle_number do
      true ->
        {:ok, middle}

      false ->
        cond do
          looking_for > middle -> {:ok, 999}
          looking_for <= middle -> {:ok, 888}
        end
    end
  end
end

# finding for 21
# in: [1, 3, 5, 8,   13, 21,    34, 55,   89, 144, 233, 377]

# length is 12, half is 6 ( -1 to keep Enum.at happy )
# at pos 5, value is = 21 and matches
# Answer is 5

# finding for 34
# in: [1, 3, 5, 8,   13, 21,    34, 55,   89, 144, 233, 377]
# length is 12, half is pos 6 ( -1 to keep Enum.at happy )
# at pos 5, value is = 21 and does NOT match
# looking for 34 is BIGGER than 21. so take RIght hand side.
# Take from 5 ( enum 0 based take ) until end

# still finding for 34, have taken 6. ( +5 since it was right hand side )
# carrying on with: [ 34, 55,   89, 144, 233, 377]
# length is 6, half is 3 ( -1 to keep Enum.at happy )
# at pos 2(3-1), value is 89 and does NOT match
# lookingt for 34 is LESS than 89. so take Left hand sise.
# Take from 2 ( enum 0 based take ) until start/beginning

# still finding for 34, have taken (5 - 3 = 2) ()
# carrying on with:
