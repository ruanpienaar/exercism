defmodule RotationalCipher do
    @doc """
    Given a plaintext and amount to shift by, return a rotated string.

    Example:
    iex> RotationalCipher.rotate("Attack at dawn", 13)
    "Nggnpx ng qnja"
    """

    @spec rotate(text :: String.t(), shift :: integer) :: String.t()
    def rotate(text, shift) do
        List.to_string(Enum.map(
            String.to_charlist(text),
            fn(x) -> circular_shift_value(x, shift) end
        ))
    end

    @spec circular_shift_value(chr_codepoint :: integer, shift :: integer) :: integer
    def circular_shift_value(chr_codepoint, 0) do
        chr_codepoint
    end
    def circular_shift_value(chr_codepoint, shift) when ( (chr_codepoint >= 65 and chr_codepoint <= 90) or 
                                                          (chr_codepoint >= 97 and chr_codepoint <= 122) 
                                                        ) and shift > 0 do
        case should_wrap(chr_codepoint) do
            {:true, start_point} ->
                circular_shift_value(start_point, shift - 1)
            :false ->
                max_shift = max_shift(chr_codepoint)
                case shift > max_shift do
                    :true ->
                        circular_shift_value(chr_codepoint + max_shift, shift - max_shift)
                    :false ->
                        circular_shift_value(chr_codepoint + shift, 0)
                end
        end
    end
    def circular_shift_value(chr_codepoint, _shift) do
        chr_codepoint
    end

    def should_wrap(90) do
        {:true, ?A}
    end
    def should_wrap(122) do
        {:true, ?a}
    end 
    def should_wrap(_) do
        :false
    end

    def max_shift(point) when point >= 65 and point <= 90 do
        ?Z - point
    end
    def max_shift(point) when point >= 97 and point <= 122 do
        ?z - point
    end

end
