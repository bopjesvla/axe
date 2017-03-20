# Axe

> The access sigil

## Motivation

Updating nested data structures in Elixir can be tricky.
The macro variant of `Kernel.*_in` is alright, but it cannot be piped
and it only supports maps and keyword lists.

## Examples

```elixir
import Axe

...

%{z: [%{b: 2}, %{b: 6}], x: %{q: 0}}
|> put_in(~a[x.q], 3)
|> update_in(~a[z.*.b], & &1 + 1)
|> update_in(~a[z.@0.b], & &1 + 100)
# %{z: [%{b: 103}, %{b: 7}], x: %{q: 3}}
```

## Installation

```elixir
def deps do
  [{:axe, "~> 0.1.0"}]
end
```
