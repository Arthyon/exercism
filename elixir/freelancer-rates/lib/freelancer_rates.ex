defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100.0)
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_sum = 22 * daily_rate(hourly_rate)
    ceil(apply_discount(monthly_sum, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_sum = apply_discount(daily_rate(hourly_rate), discount)

    Float.floor(budget / daily_sum, 1)
  end
end
