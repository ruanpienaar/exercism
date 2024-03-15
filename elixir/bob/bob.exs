defmodule Bob do

    def hey(string) do
        cond do
            just_whitespace?(string) -> "Fine. Be that way!"
            is_all_upper?(string) && is_question?(string) -> "Calm down, I know what I'm doing!"
            is_all_upper?(string) -> "Whoa, chill out!"
            is_question?(string) -> "Sure."
            true -> "Whatever."
        end
    end

    def remove_number(string) do
        :binary.list_to_bin(
            String.split(string, ~r{\d}, trim: true)
        )
    end

    def just_whitespace?(string) do
        Enum.all?(
            String.to_charlist(string),
            fn char -> [char] == ' ' end
        )
    end

    def is_all_upper?(string) do
        upper = String.upcase(string)
        string == upper and String.match?(remove_number(string), ~r/[[:alpha:]]/)
    end

    def is_question?(string) do
        "?" == String.last(string)
    end

end