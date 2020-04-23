defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(fn x -> transcript(x) end)
  end

  def transcript(?G) do
    ?C
  end

  def transcript(?C) do
    ?G
  end

  def transcript(?T) do
    ?A
  end

  def transcript(?A) do
    ?U
  end
end
#
