use Bitwise

defmodule SecretHandshake do
    @doc """
    Determine the actions of a secret handshake based on the binary
    representation of the given `code`.
    If the following bits are set, include the corresponding action in your list
    of commands, in order from lowest to highest.

    1(dec 1) = wink
    10(dec 2) = double blink
    100(dec 4) = close your eyes
    1000(dec 8) = jump
    10000(dec 16) = Reverse the order of the operations in the secret handshake
    """
    @spec commands(code :: integer) :: list(String.t())
    def commands(dec_val) do
        bits = [0b01000, 0b00100, 0b00010, 0b00001]
        hshake = Enum.reduce(bits, [],
            fn(bit, acc) ->
                band_match(bit, dec_val, acc,
                    fn () -> [ action_string(bit) | acc] end)
            end
        )
        band_match(0b10000, dec_val, hshake,
            fn () -> Enum.reverse(hshake) end)
    end

    # @spec band_match()
    def band_match(bit, dec_val, acc, f) do
        case band(bit, dec_val) do
            ^bit ->
                f.()
            _ ->
                acc
        end
    end

    def action_string(x) when x == 1 do
        "wink"
    end
    def action_string(x) when x == 2 do
        "double blink"
    end
    def action_string(x) when x == 4 do
        "close your eyes"
    end
    def action_string(x) when x == 8 do
        "jump"
    end

end
