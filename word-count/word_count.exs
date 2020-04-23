defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> Macro.underscore
    |> String.replace(",", "")
    |> String.replace(~r/\_/, " ")
    |> String.replace(~r/[\:\!\&\@\$\%\^]/, " ")
    |> String.split(" ", trim: true)
    |> Enum.reduce(%{}, fn (arg, acc) -> _acc(arg, acc) end)
  end

  defp _acc(arg, acc) do
    res = acc[arg]
    _acc(res, arg, acc)
  end

  defp _acc(nil, arg, acc) do
    Map.put(acc, arg, 1)
  end

  defp _acc(val, arg, acc) do
    Map.put(acc, arg, val + 1)
  end
end


