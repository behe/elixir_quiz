"""
  http://elixirquiz.github.io/2014-08-16-run-length-encoding.html
"""

defmodule RLE do
  def encode(input) do
    String.codepoints(input)
    |> _encode([])
    |> Enum.join
  end

  def _encode([], out), do: Enum.reverse(out)

  def _encode([char | rest], out) do
    _encode(rest, {1, char}, out)
  end

  def _encode([char | rest], {n, char}, out) do
    _encode(rest, {n + 1, char}, out)
  end

  def _encode(rest, {n, char}, out) do
    _encode(rest, ["#{n}#{char}" | out])
  end
end

ExUnit.start

defmodule RLETest do
  use ExUnit.Case

  test "Encode single char entry" do
    assert RLE.encode("a") == "1a"
  end

  test "Encode multiple char entry" do
    assert RLE.encode("aaa") == "3a"
  end

  test "Encode multiple entries" do
    assert RLE.encode("abbccc") == "1a2b3c"
  end

  test "Encode sample string" do
    assert RLE.encode("JJJTTWPPMMMMYYYYYYYYYVVVVVV") == "3J2T1W2P4M9Y6V"
  end
end
