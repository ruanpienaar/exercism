defmodule NucleotideCount do
    @nucleotides [?A, ?C, ?G, ?T]

    @doc """
    Counts individual nucleotides in a NucleotideCount strand.

    ## Examples

    iex> NucleotideCount.count('AATAA', ?A)
    4

    iex> NucleotideCount.count('AATAA', ?T)
    1
    """
    @spec count([char], char) :: non_neg_integer

    def count([], nucleotide) do
        0
    end
    def count(strand, nucleotide) do
        Enum.reduce(strand, 0,
            fn(i, acc) ->
                case i == nucleotide do
                    true ->
                        acc+1
                    false ->
                        acc
                end
            end
        )
    end

    @doc """
    Returns a summary of counts by nucleotide.

    ## Examples

    iex> NucleotideCount.histogram('AATAA')
    %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
    """
    @spec histogram([char]) :: map
    def histogram(strand) do
        %{
            ?A => count(strand, ?A),
            ?T => count(strand, ?T),
            ?C => count(strand, ?C),
            ?G => count(strand, ?G)
        }

    end
end