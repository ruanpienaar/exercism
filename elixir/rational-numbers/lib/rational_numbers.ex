defmodule RationalNumbers do
  def add({a1, b1}, {a2, b2}), do: reduce({a1 * b2 + a2 * b1, b1 * b2})

  def subtract({a1, b1}, {a2, b2}), do: reduce({a1 * b2 - a2 * b1, b1 * b2})

  def multiply({a1, b1}, {a2, b2}), do: reduce({a1 * a2, b1 * b2})

  def divide_by({a1, b1}, {a2, b2}), do: reduce({a1 * b2, a2 * b1})

  def abs({a, b}), do: reduce({Kernel.abs(a), Kernel.abs(b)})

  def pow_rational({a, b}, n) when n >= 0, do: reduce({Integer.pow(a, n), Integer.pow(b, n)})

  def pow_rational({a, b}, n) do
    m = Kernel.abs(n)
    reduce({Integer.pow(b, m), Integer.pow(a, m)})
  end

  def pow_real(x, {a, b}), do: :math.pow(x, a / b)

  def reduce({0, _b}), do: {0, 1}

  def reduce({a, b}) do
    g = gcd(Kernel.abs(a), Kernel.abs(b))
    sign = if b < 0, do: -1, else: 1
    {sign * div(a, g), sign * div(b, g)}
  end

  defp gcd(a, 0), do: a
  defp gcd(a, b), do: gcd(b, rem(a, b))
end
