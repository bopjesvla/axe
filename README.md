# Axe

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

## Installation

```elixir
def deps do
  [{:axe, "~> 0.1.0"}]
end
```
