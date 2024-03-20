defmodule FreelancerRates do

  @billable_hours_in_day 8.0
  @billable_days_in_month 22

  def daily_rate(hourly_rate) do
    @billable_hours_in_day * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    percentage_of(discount, before_discount)
  end

  def monthly_rate(hourly_rate, discount) do
    round(get_x_days_rate(hourly_rate, discount, @billable_days_in_month))
  end

  defp get_x_days_rate(hourly_rate, discount, days) do
    Float.ceil(
      apply_discount(
        daily_rate(hourly_rate) * days,
        discount
      )
    )
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(budget / get_x_days_rate(hourly_rate, discount, 1), 1)
  end

  defp percentage_of(percent, number)
      when percent <= 100 or
           percent >= 0 do
    ((100 - percent) * 0.01) * number
  end

end