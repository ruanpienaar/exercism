defmodule RationalNumbers do
  # {a1, b1}
  @type rational :: {integer, integer}

  @doc """
  Gets the common demoninator of 2 fractions - NB: not simplified
  """
  defp get_common_denominator({numerator1, denominator1}, {numerator2, denominator2}) do
    # {3/6}  &  {4/6}
    # 1*3=  3
    common_nominator1 = numerator1 * denominator2
    # 2*3=  6
    common_denominator1 = denominator1 * denominator2
    # 3/6

    # 2*2=  4
    common_nominator2 = numerator2 * denominator1
    # 3*2=  6
    common_denominator2 = denominator2 * denominator1
    # 4/6
    { {common_nominator1, common_denominator1}, {common_nominator2, common_denominator2} }
  end

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({numerator1, denominator1}, {numerator2, denominator2}) do

    # greatest_denominator = Integer.gcd(denominator1, denominator1)

    a = {numerator1, denominator1}
    b = {numerator2, denominator2}

    # {3/6} + {4/6}
    # {7/6}


    

    { {common_nominator1, common_denominator1}, {common_nominator2, _common_denominator2} } = 
      get_common_denominator(a, b)
    # {3, 6} + {4, 6} -> {3 + 4} / 6 => 7/6
    reduce({common_nominator1 + common_nominator2, common_denominator1})

  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do

    # {1, 2} - {2, 3}
    # {-1, 6}
    { {common_nominator1, common_denominator1}, {common_nominator2, _common_denominator2} } = 
      get_common_denominator(a, b)

    common_denominator1 = case common_nominator1 - common_nominator2 do 
      0 ->
        common_denominator1 = 1
      _ ->
        common_denominator1
    end

    {common_nominator1 - common_nominator2, common_denominator1}
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({numerator1, denominator1}, {0, denominator2}) do
    {0, denominator2}
  end
  def multiply({numerator1, denominator1}, {numerator2, denominator2}) do
    reduce({numerator1 * numerator2, denominator1 * denominator2})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({numerator1, denominator1}, {numerator2, denominator2}) do

    IO.puts("fraction is {#{numerator2}, #{denominator2}}\n")

    # if numerator2 is negative, make denominator2 negative.
    {numerator2, denominator2} = 
      case numerator2 < 0 do
        true ->
          {numerator2 * -1, denominator2 * -1}
        false ->
          {numerator2, denominator2}
      end

    reciprocal = {denominator2, numerator2}
    
    IO.puts("reciprocal is {#{denominator2}, #{numerator2}}\n")
    multiply({numerator1, denominator1}, reciprocal)
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({numerator, denominator}) do
    reduce({Kernel.abs(numerator), Kernel.abs(denominator)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({numerator, denominator}, n) do
    absn = Kernel.abs(n)
    {Integer.pow(numerator, absn), Integer.pow(denominator, absn)}
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {numerator, denominator}) do
    # assert_in_delta RationalNumbers.pow_real(8, {4, 3}), 16.0, 1.0e-10
    # Assert match with allowed delta of 1.0e-10 ( 0.0000000001 )

    # 8 {4, 3}
    Float.pow(x+0.0, denominator / numerator)

  end

  @doc """
  Reduce a rational number to its lowest terms

  Find the simplest fraction possible Ex: 4/8 -> 2/4 -> 1/2.
  TODO: NB: only handles fractions(4/8) not Improper Fractions(8/4)
  TODO: def -> defp
  method 1 exactly divide ( both by 2, 3, 4, 5 ...)
  method 2 divide by greatest common factor 8/12 -> 4, 8 % 4, 12 % 4 ( how to get greatest common factor )
  """
  @spec reduce(a :: rational) :: rational
  def reduce({numerator=1, denominator}) do
    {numerator=1, denominator}
  end
  def reduce({numerator, denominator}) do
    starting_divider(numerator, denominator)
  end

  defp starting_divider(num=0, den) do
    {num, den}
  end
  defp starting_divider(num, den) do

    gcd = 
      cond do 
        den < 0 ->
          Integer.gcd(num, den) * -1
        true ->
          Integer.gcd(num, den)
      end

    {round(num/gcd), round(den/gcd)}

  end

end

























