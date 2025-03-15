defmodule LibraryFees do
  # TODO: regex string input datetime validity

  def datetime_from_string(datetime_string) do
    with true <- valid_iso8601_datetime_string?(datetime_string),
         {:ok, naive_datetime} = NaiveDateTime.from_iso8601(datetime_string) do
      naive_datetime
    else
      error ->
        {:error, error}
    end
  end

  defp valid_iso8601_datetime_string?(string) do
    Regex.match?(
      ~r/^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})(?:\.\d+)?(Z|[+-]\d{2}:\d{2})?$/,
      string
    )
  end

  def before_noon?(naive_datetime) do
    NaiveDateTime.to_time(naive_datetime).hour < 12
  end

  def return_date(checkout_naive_datetime) do
    NaiveDateTime.to_date(
      NaiveDateTime.shift(
        checkout_naive_datetime,
        Duration.new!(day: return_days(checkout_naive_datetime))
      )
    )
  end

  defp return_days(checkout_naive_datetime) do
    if before_noon?(checkout_naive_datetime) do
      28
    else
      29
    end
  end

  def days_late(expected_return_date, checkin_naive_datetime) do
    checkin_naive_date = NaiveDateTime.to_date(checkin_naive_datetime)

    IO.inspect(expected_return_date, label: :expected_return_date)
    IO.inspect(checkin_naive_date, label: :checkin_naive_date)

    late = Date.diff(expected_return_date, checkin_naive_date)
    IO.inspect(late, label: :days_late)

    if late < 0 do
      abs(late)
    else
      0
    end
  end

  def monday?(naive_datetime) do
    Date.day_of_week(NaiveDateTime.to_date(naive_datetime), :monday) == 1
  end

  def calculate_late_fee(checkout_naive_datetime_string, checkin_datetime_string, rate) do
    IO.puts(
      "checkout_naive_datetime_string: #{checkout_naive_datetime_string}, checkin_datetime_string:#{checkin_datetime_string}, rate: #{inspect(rate)}"
    )

    apply_monday_return_discount(
      datetime_from_string(checkin_datetime_string),
      days_late(
        return_date(datetime_from_string(checkout_naive_datetime_string)),
        datetime_from_string(checkin_datetime_string)
      ) * rate
    )
  end

  defp apply_monday_return_discount(checkin_naive_datetime, fee) do
    if monday?(checkin_naive_datetime) do
      trunc(fee * 0.5)
    else
      fee
    end
  end
end
