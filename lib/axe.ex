defmodule Axe do
  @moduledoc """
  Documentation for Axe.
  """

  @doc ~S"""
  The access sigil.

  ## Examples

      iex> import Axe
      Axe
      iex> x = %{z: [%{b: 2}, %{b: 6}]}
      %{z: [%{b: 2}, %{b: 6}]}
      iex> update_in(x, ~a[z.*.b], & &1 + 1)
      %{z: [%{b: 3}, %{b: 7}]}
      iex> update_in(x, ~a[z.@0.b], & &1 + 1)
      %{z: [%{b: 3}, %{b: 6}]}
  """
  def sigil_a(string, _modifiers) do
    string
    |> String.split(".")
    |> Enum.map(&get_accessor/1)
  end

  defp get_accessor("*"), do: Access.all
  defp get_accessor("@" <> int) do
    int
    |> String.to_integer
    |> Access.at
  end
  defp get_accessor(atom) do
    atom
    |> String.to_atom
    |> Access.key!
  end
end
