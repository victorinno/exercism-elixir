defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    romans = _numerals(%{}, number)
    ""
    |> _concat_romans(fn () -> duplicate("I", romans["I"]) end)
    |> _concat_romans(fn () -> duplicate("IV", romans["IV"]) end)
    |> _concat_romans(fn () -> duplicate("V", romans["V"]) end)
    |> _concat_romans(fn () -> duplicate("IX", romans["IX"]) end)
    |> _concat_romans(fn () -> duplicate("X", romans["X"]) end)
    |> _concat_romans(fn () -> duplicate("XL", romans["XL"]) end)
    |> _concat_romans(fn () -> duplicate("L", romans["L"]) end)
    |> _concat_romans(fn () -> duplicate("XC", romans["XC"]) end)
    |> _concat_romans(fn () -> duplicate("C", romans["C"]) end)
    |> _concat_romans(fn () -> duplicate("CD", romans["CD"]) end)
    |> _concat_romans(fn () -> duplicate("D", romans["D"]) end)
    |> _concat_romans(fn () -> duplicate("CM", romans["CM"]) end)
    |> _concat_romans(fn () -> duplicate("M", romans["M"]) end)
  end

  defp duplicate(_text, value) when is_nil(value) do
    ""
  end

  defp duplicate(text, value) do
    String.duplicate(text, value)
  end

  defp _numerals(romanos, numero) when numero >= 1000 do
    d = div(numero, 1000)
    _numerals(Map.put(romanos, "M", d), rem(numero, 1000))
  end

  defp _numerals(romanos, numero) when numero >= 900 and numero < 1000 do
    _numerals(Map.put(romanos, "CM", 1), numero - 900)
  end

  defp _numerals(romanos, numero) when numero >= 500 and numero < 900 do
    d = div(numero, 500)
    _numerals(Map.put(romanos, "D", d), rem(numero, 500))
  end

  defp _numerals(romanos, numero) when numero >= 400 and numero < 500 do
    _numerals(Map.put(romanos, "CD", 1), numero - 400)
  end

  defp _numerals(romanos, numero) when numero >= 100 and numero < 400 do
    d = div(numero, 100)
    _numerals(Map.put(romanos, "C", d), rem(numero, 100))
  end

  defp _numerals(romanos, numero) when numero >= 90 and numero < 100 do
    _numerals(Map.put(romanos, "XC", 1), numero - 90)
  end

  defp _numerals(romanos, numero) when numero >= 50 and numero < 90 do
    d = div(numero, 50)
    _numerals(Map.put(romanos, "L", d), rem(numero, 50))
  end

  defp _numerals(romanos, numero) when numero >= 40 and numero < 50 do
    _numerals(Map.put(romanos, "XL", 1), numero - 40)
  end

  defp _numerals(romanos, numero) when numero >= 10 and numero < 40 do
    _numerals(Map.put(romanos, "X", div(numero, 10)), rem(numero, 10))
  end

  defp _numerals(romanos, numero) when numero >= 5 and numero < 9 do
    _numerals(Map.put(romanos, "V", div(numero, 5)), rem(numero, 5))
  end

  defp _numerals(romanos, numero) when numero < 4 do
    Map.put(romanos, "I", numero)
  end

  defp _numerals(romanos, numero) when numero == 4 do
    Map.put(romanos, "IV", 1)
  end

  defp _numerals(romanos, numero) when numero == 9 do
    Map.put(romanos, "IX", 1)
  end

  defp _concat_romans(roman, get_value) do
    _concat(roman, get_value.())
  end

  defp _concat(roman, value) when is_nil(value) do
    roman
  end

  defp _concat(roman, 0) do
    roman
  end

  defp _concat(roman, value) do
    value <> roman
  end


  # defp _numerals(roman, number) when number >= 1000 and rem(number, 1000) == 0 do
  #   to_repeat = div(number, 1000)
  #   roman <> String.duplicate("M", to_repeat)
  # end

  # defp _numerals(roman, number) when number >= 1000 and rem(number, 1000) != 0 do
  #   to_repeat = div(number, 1000)
  #   roman <> String.duplicate("M", to_repeat) |>
  #    _numerals( rem(number, 1000))
  # end

  # defp _numerals(roman, number) when number >= 500 and rem(number, 500) == 0 do
  #   to_repeat = div(number, 500)
  #   roman <> String.duplicate("D", to_repeat)
  # end

  # defp _numerals(roman, number) when number >= 500 and rem(number, 500) != 0 do
  #   to_repeat = div(number, 500)
  #   roman <> String.duplicate("D", to_repeat)
  #   |> _numerals(rem(number, 500))
  # end

  # defp _numerals(roman, number) when number >= 100 and rem(number, 100) == 0 do
  #   to_repeat = div(number, 100)
  #   roman <> String.duplicate("C", to_repeat)
  # end

  # defp _numerals(roman, number) when number >= 100 and rem(number, 100) != 0 do
  #   to_repeat = div(number, 100)
  #   roman <> String.duplicate("C", to_repeat)
  #   |> _numerals(rem(number, 100))
  # end

  # defp _numerals(roman, number) when number >= 50 and rem(number, 50) == 0 do
  #   to_repeat = div(number, 50)
  #   roman <> String.duplicate("L", to_repeat)
  # end

  # defp _numerals(roman, number) when number >= 50 and rem(number, 50) != 0 do
  #   to_repeat = div(number, 50)
  #   roman <> String.duplicate("L", to_repeat)
  #   |> _numerals(rem(number, 50))
  # end

  # defp _numerals(roman, number) when number >= 10 and rem(number, 10) == 0 do
  #   to_repeat = div(number, 10)
  #   roman <> String.duplicate("X", to_repeat)
  # end

  # defp _numerals(roman, number) when number >= 10 and rem(number, 10) != 0 do
  #   to_repeat = div(number, 10)
  #   roman <> String.duplicate("X", to_repeat)
  #   |> _numerals(rem(number, 10))
  # end

  # defp _numerals(roman, number) when number >= 5 and rem(number, 5) == 0 do
  #   to_repeat = div(number, 5)
  #   roman <> String.duplicate("V", to_repeat)
  # end

  # defp _numerals(roman, number) when number >= 5 and rem(number, 5) != 0 do
  #   to_repeat = div(number, 5)
  #   roman <> String.duplicate("V", to_repeat)
  #   |> _numerals( rem(number, 5))
  # end




end
