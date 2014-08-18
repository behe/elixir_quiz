"""
  http://elixirquiz.github.io/2014-08-11-fizzbuzz.html
"""
defmodule FizzBuzz do
  def up_to(n) do
    1..n
    |> Enum.to_list
    |> Enum.map(&transform/1)
    |> Enum.join " "
  end

  def transform(n) when rem(n, 15) == 0 do
    "FizzBuzz"
  end

  def transform(n) when rem(n, 5) == 0 do
    "Buzz"
  end

  def transform(n) when rem(n, 3) == 0 do
    "Fizz"
  end

  def transform(n) do
    n
  end
end

ExUnit.start

defmodule FizzBuzzTest do
  use ExUnit.Case

  test "Number divisible by 3 returns Fizz" do
    assert FizzBuzz.transform(3) == "Fizz"
  end

  test "Number divisible by 5 returns Buzz" do
    assert FizzBuzz.transform(5) == "Buzz"
  end

  test "Number divisible by 3 and 5 returns FizzBuzz" do
    assert FizzBuzz.transform(15) == "FizzBuzz"
  end

  test "Other numbers returns itself" do
    assert FizzBuzz.transform(1) == 1
  end

  test "First 15 numbers are correct" do
    assert FizzBuzz.up_to(15) == "1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz"
  end
end

IO.puts FizzBuzz.up_to(100)
